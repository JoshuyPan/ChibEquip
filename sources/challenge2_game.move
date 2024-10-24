module challenge2::game{

    use sui::table::{Self, Table};
    use std::string::{String};

    use challenge2::equip::{Self};
    use challenge2::chib::{Self, Chib};

    //Errors
    const E_ALREADY_REGISTRED: u64 = 1;
    const E_NOT_REGISTRED: u64 = 2;

    public struct Admin has key{
        id: UID,
    }

    public struct Game has key{
        id: UID,
        addressToChib: Table<address, Chib>
    }

    fun init(ctx: &mut TxContext){
        let game = Game {
            id: object::new(ctx),
            addressToChib: table::new(ctx) 
        };
        transfer::share_object(game);
        transfer::transfer(Admin{ id : object::new(ctx)}, tx_context::sender(ctx))
    }

    public entry fun create_chib(
        game: &mut Game,
        name: String, 
        ctx: &mut TxContext)
    {
        // prevents the user to mint 2 chibs on the same address
        let isRegistred = &game.addressToChib.contains(tx_context::sender(ctx));
        assert!(isRegistred == false, E_ALREADY_REGISTRED);

        let newChib = chib::create_chib(name, ctx);
        game.addressToChib.add(tx_context::sender(ctx), newChib);
    }

    public entry fun gandalf_equipment_donor(
        game: &mut Game,
        ctx: &mut TxContext
    ){
        // check if the user is registred,  then grab his chib 
        assert!(game.addressToChib.contains(tx_context::sender(ctx)), E_NOT_REGISTRED);
        let chib = game.addressToChib.borrow_mut(tx_context::sender(ctx));

        //instanciate the gandalf's Set
        let helmet = equip::create_gandalf_helmet(ctx);
        let chest = equip::create_gandalf_chest(ctx);
        let leg = equip::create_gandalf_legs(ctx);
        let weapon = equip:: create_gandalf_weapon(ctx);

        chib.add_item_inventory(helmet);
        chib.add_item_inventory(chest);
        chib.add_item_inventory(leg);
        chib.add_item_inventory(weapon);
    }

    public entry fun legolas_equipment_donor(
        game: &mut Game,
        ctx: &mut TxContext
    ){
        // check if the user is registred,  then grab his chib 
        assert!(game.addressToChib.contains(tx_context::sender(ctx)), E_NOT_REGISTRED);
        let chib = game.addressToChib.borrow_mut(tx_context::sender(ctx));

        //instanciate the gandalf's Set
        let helmet = equip::create_legolas_helmet(ctx);
        let chest = equip::create_legolas_chest(ctx);
        let leg = equip::create_legolas_legs(ctx);
        let weapon = equip:: create_legolas_weapon(ctx);

        chib.add_item_inventory(helmet);
        chib.add_item_inventory(chest);
        chib.add_item_inventory(leg);
        chib.add_item_inventory(weapon);
    }

    public entry fun equip_piece_equip(
        game: &mut Game,
        index: u64,
        ctx: &mut TxContext
    ){
        let chib = game.addressToChib.borrow_mut(tx_context::sender(ctx));
        let equipKind = chib.retrieve_equip_kind(index);
        let isEquipable = chib.check_equip_kind_is_free(equipKind);

        if(isEquipable){
            chib.equip(index);
            chib.add_equip_stats();
        }else{
            abort(0)
        }
    }

    public entry fun unequip_all(
        game: &mut Game,
        ctx: &mut TxContext
    )
    {
        let chib = game.addressToChib.borrow_mut(tx_context::sender(ctx));

        chib.unequip_all();
    }
}