const std = @import("std");
const Allocator = std.mem.Allocator;

const impl = @import("binding.zig").book;

/// Fetches the latest recorded book changes for a player.
///
/// If 'dupe' is true, the caller owns both the returned slice and its contents.
/// If 'dupe' is false, the caller owns the returned slice, but not its contents,
/// and the contents will become invalid after the initial callback returns.
pub fn fetch(pid: c_ushort, allocator: Allocator, dupe: bool) Allocator.Error![][:0]const u8 {
    const books = try allocator.alloc([:0]const u8, impl.getBookChangesSize(pid));
    errdefer {
        if (dupe) {
            for (books) |book| {
                allocator.free(book);
            }
        }
        allocator.free(books);
    }

    for (books, 0..) |*book, index| {
        const new = impl.getBookId(pid, index);
        book = if (dupe) try allocator.dupe(u8, new) else new;
    }

    return books;
}

/// If is_dupe is true, also frees all contained strings.
pub fn deinit(books: [][:0]const u8, allocator: Allocator, is_dupe: bool) void {
    if (is_dupe) {
        for (books) |book| {
            allocator.free(book);
        }
    }
    allocator.free(books);
}

/// Pushes the contents of 'books' as the latest book changes for players.
pub fn push(
    pid: c_ushort,
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
