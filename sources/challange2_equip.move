module challenge2::equip{

    use std::string::{String};

    //Special note on kind -> 0 Helmet, 1 Chest, 2 Legs, 3 Weapon
    public struct Equip has key, store{
        id: UID,
        name: String,
        defence: u128,
        attack: u128,
        kind: u8,
        isEquipped: bool,
    }

    //Functions
    public fun create_gandalf_helmet(ctx: &mut TxContext): Equip{
        Equip{
            id: object::new(ctx),
            name: b"Gandalf's Hat".to_string(),
            defence: 1258,
            attack: 10,
            kind: 0,
            isEquipped: false
        }
    }

    public fun create_gandalf_chest(ctx: &mut TxContext): Equip{
        Equip {
            id: object::new(ctx),
            name: b"Gandalf's Vest".to_string(),
            defence: 3512,
            attack: 12,
            kind: 1,
            isEquipped: false
        }
    }

    public fun create_gandalf_legs(ctx: &mut TxContext): Equip{
        Equip {
            id: object::new(ctx),
            name: b"Gandalf's stinky Underwears".to_string(),
            defence: 2963,
            attack: 15,
            kind: 2,
            isEquipped: false,
        }
    }

    public fun create_gandalf_weapon(ctx: &mut TxContext): Equip{
        Equip {
            id: object::new(ctx),
            name: b"Gandalf's Staff".to_string(),
            defence: 100,
            attack: 4322,
            kind: 3,
            isEquipped: false,
        }
    }

    public fun create_legolas_helmet(ctx: &mut TxContext): Equip{
        Equip{
            id: object::new(ctx),
            name: b"Legolas's wig".to_string(),
            defence: 258,
            attack: 10,
            kind: 0,
            isEquipped: false
        }
    }

    public fun create_legolas_chest(ctx: &mut TxContext): Equip{
        Equip {
            id: object::new(ctx),
            name: b"Legolas's Mithril".to_string(),
            defence: 1512,
            attack: 12,
            kind: 1,
            isEquipped: false
        }
    }

    public fun create_legolas_legs(ctx: &mut TxContext): Equip{
        Equip {
            id: object::new(ctx),
            name: b"Legolas's Collant".to_string(),
            defence: 863,
            attack: 15,
            kind: 2,
            isEquipped: false,
        }
    }

    public fun create_legolas_weapon(ctx: &mut TxContext): Equip{
        Equip {
            id: object::new(ctx),
            name: b"Legolas's Bow".to_string(),
            defence: 100,
            attack: 3322,
            kind: 3,
            isEquipped: false,
        }
    }

    public fun set_equipped(equip: &mut Equip, state: bool) {
        equip.isEquipped = state;
    }

    //Getters
    public fun get_equip_name(equip: &Equip): String {
        equip.name
    }

    public fun get_equip_defence(equip: &Equip): u128 {
        equip.defence
    }

    public fun get_equip_attack(equip: &Equip): u128 {
        equip.attack
    }

    public fun get_equip_kind(equip: &Equip): u8{
        equip.kind
    }

    public fun get_equip_isEquipped(equip: &Equip): bool{
        equip.isEquipped
    }

}