hint:

```
Keeping it in the field of chibs: 

Have a chib, the chib should have an armour section which should allow for 4 nft armour pieces to be attached to it. 

Chib -> armour equiped -> armour pieces such as helmet, torso, pants and boots. 

So an object (chib) that hold another object (armour set) which holds for objects (armour pieces.)
```

### BRIEF EXPLANATION:

As you can notice, i fell in love with the Game Checker object, so i made this package that you just need to pass that as an argument to all the entry functions that lives in the game module.

The main package is structured that the Game Object takes ownership on your Chib and passes it to all the functions making sure, you can't do certain thing like equip more than 1 piece of armor at time.
This time i decided to push the project even more, so i added the functionality that, when you equip a piece of Armor or a Weapon, the Attack and Defence of your Chibs increase/decrease accordingly with the equipment stats.

Here the ids that you need to use in order to call the contract and start interacting with it.

Game Object:
```bash
@0x58e612140ad7d62e48c357a104ae22cc7ead16907ab90fe2769070e85129a7ee
```

Package ID:
```bash
0xd1ecef5e2f194be65ba456ed2ad3572dbd90b5e4e0f361885eb409381eebe909
```

### INTERACTING WITH SUI CLI:

Before you start, open:

Game: https://testnet.suivision.xyz/object/0x58e612140ad7d62e48c357a104ae22cc7ead16907ab90fe2769070e85129a7ee

and see how your chib will be added to the game itself

### STEP 1: create_chib :

Change \"Your Name\" before sending the command.

```bash
sui client ptb \
--gas-budget 10000000 \
--move-call 0xd1ecef5e2f194be65ba456ed2ad3572dbd90b5e4e0f361885eb409381eebe909::game::create_chib @0x58e612140ad7d62e48c357a104ae22cc7ead16907ab90fe2769070e85129a7ee \"Your Name\"
```

now grab the id of your chib and open a tab on https://testnet.suivision.xyz/ to inspect it,
before moving on, look to his attack, his inventory and all the stuffs.

### STEP 2: gandalf_equipment_donor & legolas_equipment_donor :

This 2 functions are the ones that drops you the 2 available sets in-game, i had some fun with the naming of the equip, give it a sight.
Here comes into play the beauty of the Game object, from now in on, we need just him to take care of all the logic, so you have just to pass his ID through ptb call like this:

```bash
sui client ptb \
--move-call 0xd1ecef5e2f194be65ba456ed2ad3572dbd90b5e4e0f361885eb409381eebe909::game::gandalf_equipment_donor @0x58e612140ad7d62e48c357a104ae22cc7ead16907ab90fe2769070e85129a7ee 
```

and

```bash
sui client ptb \
--move-call 0xd1ecef5e2f194be65ba456ed2ad3572dbd90b5e4e0f361885eb409381eebe909::game::legolas_equipment_donor @0x58e612140ad7d62e48c357a104ae22cc7ead16907ab90fe2769070e85129a7ee 
```

Now go back to your chib into the testnet explorer and look into the inventory.
The stats remains the same cause we didn't equipped nothing yet, so lets go ahead.

### STEP 3: equip_piece_equip

I asked you to have the chib inventory open, because our function takes the index of the piece of equip inside the chib inventory. In real life, the call is managed by the frontend, but here, we're doing things in a primitive way.

so lets say you want to equip the Legola's Wig that is on index 7 of the array:

```bash
sui client ptb \
--move-call 0xd1ecef5e2f194be65ba456ed2ad3572dbd90b5e4e0f361885eb409381eebe909::game::equip_piece_equip @0x58e612140ad7d62e48c357a104ae22cc7ead16907ab90fe2769070e85129a7ee 7
```

now test to equip the gandalf hat and will revert as soon as you unequip all.
Check how the chibs stats changes.

### STEP 4: unequip_all

easy easy:

```bash
sui client ptb \
--move-call 0xd1ecef5e2f194be65ba456ed2ad3572dbd90b5e4e0f361885eb409381eebe909::game::unequip_all @0x58e612140ad7d62e48c357a104ae22cc7ead16907ab90fe2769070e85129a7ee 
```
