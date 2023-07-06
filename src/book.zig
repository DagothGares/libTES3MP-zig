const std = @import("std");
const Allocator = std.mem.Allocator;

const impl = @import("binding.zig").book;

/// Fetches the latest recorded book changes for a player.
///
/// If 'dupe' is true, the caller owns both the returned slice and its contents.
/// If 'dupe' is false, the caller owns the returned slice, but not its contents,
/// and the contents will become invalid after the initial callback returns.
pub fn fetch(pid: u16, allocator: Allocator, dupe: bool) Allocator.Error![][:0]const u8 {
    const books = try allocator.alloc([:0]const u8, impl.getBookChangesSize(pid));
    var capacity: u32 = 0;
    errdefer {
        if (dupe) {
            for (books[0..capacity]) |book| {
                allocator.free(book);
            }
        }
        allocator.free(books);
    }

    for (books) |*book| {
        const new = std.mem.span(impl.raw.getBookId(pid, capacity).?);
        book = if (dupe) try allocator.dupe(u8, new) else new;

        capacity += 1;
    }

    return books;
}

/// Pushes the contents of 'books' as the latest book changes for players.
pub fn push(
    pid: u16,
    books: [][:0]const u8,
    for_everyone: bool,
    skip_attached_player: bool,
) void {
    impl.clearBookChanges(pid);

    for (books) |b| {
        impl.addBook(pid, b);
    }

    return impl.sendBookChanges(pid, for_everyone, skip_attached_player);
}
