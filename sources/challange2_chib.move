module challenge2::chib{

    use std::string::{String};

    use challenge2::equip::{Equip};

    public struct Chib has key, store {
        id: UID,
        owner: address,
        name: String,
        hp: u128,
        mana: u128,
        attack: u128,
        defence: u128,
        inventory: vector<Equip>
    }

    public fun create_chib(name: String, ctx: &mut TxContext): Chib {
        Chib {
            id: object::new(ctx),
            owner: tx_context::sender(ctx),
            name: name,
            hp: 500,
            mana: 300,
            attack: 50,
            defence: 20,
            inventory: vector::empty()
        }
    }

    public fun add_item_inventory(chib: &mut Chib, item: Equip){
        chib.inventory.push_back(item);
    }

    public fun equip(chib: &mut Chib, equipIndex: u64){
        chib.inventory[equipIndex].set_equipped(true);
    }

    public fun add_equip_stats(chib: &mut Chib){
        let chibBasicAttack = 50; 
        let chibBasicDefence = 20;
        let mut attackBonus: u128 = 0;
        let mut defenceBonus: u128 = 0;
        let mut i = 0;

        while(chib.inventory.length() > i){
            if(chib.inventory[i].get_equip_isEquipped() == true){
                attackBonus = attackBonus + chib.inventory[i].get_equip_attack();
                defenceBonus = defenceBonus + chib.inventory[i].get_equip_defence();
            };
            i = i + 1;
        };

        

        chib.set_attack(chibBasicAttack + attackBonus);
        chib.set_defence(chibBasicDefence + defenceBonus);
    }

    public fun unequip_all(chib: &mut Chib){
        let mut i = 0;

        while(chib.inventory.length() > i){
            chib.inventory[i].set_equipped(false);
            i = i + 1;
        };

        chib.add_equip_stats();
    }

    //Getters
    public fun get_chib_owner(chib: &Chib): address {
        chib.owner
    }

    public fun get_chib_name(chib: &Chib): String {
        chib.name
    }

    public fun get_chib_hp(chib: &Chib): u128 {
        chib.hp
    }
    
    public fun get_chib_mana(chib: &Chib): u128 {
        chib.mana
    }
    
    public fun get_chib_attack(chib: &Chib): u128 {
        chib.attack
    }

    public fun get_chib_defence(chib: &Chib): u128 {
        chib.defence
    }

    public fun get_chib_inventory_length(chib: &Chib): u64 {
        chib.inventory.length()
    }


    public fun retrieve_equipped_equip(chib: &Chib, index: u64): bool{
        chib.inventory[index].get_equip_isEquipped()
    }

    public fun retrieve_equip_kind(chib: &Chib, index: u64): u8{
        chib.inventory[index].get_equip_kind()
    }

    public fun check_equip_kind_is_free(chib: &Chib, equipKind: u8): bool{
        let mut i = 0;

        while(chib.inventory.length() > i){
            if((chib.inventory[i].get_equip_kind() == &equipKind) && chib.inventory[i].get_equip_isEquipped()){
                return false
            };
            i = i +1;
        };

        return true
    }

    //Private
    fun set_attack(chib: &mut Chib, value: u128){
        chib.attack = value;
    }

    fun set_defence(chib: &mut Chib, value: u128){
        chib.defence = value;
    }

}
