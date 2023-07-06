pub const impl = @import("binding.zig").actor;

pub const ActorListAction = impl.ActorListAction;
pub const SpellsActiveAction = impl.SpellsActiveAction;
pub const EquipmentSlot = impl.EquipmentSlot;
pub const CharacterState = impl.CharacterState;
pub const AiAction = impl.AiAction;

// TODO: not sure how best to wrap the actor functions into an interface
