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

BUG: I implemented a function that checks if a piece of armor is equipped and adds the stats to your Chib, but actually is not working, i have to fix it.

Here the ids that you need to use in order to call the contract and start interacting with it.


Game Object:
```bash
@0xab543980073872460f8771e248183474b4298af9c8a4ea3d4abdfb1607c81f38
```

Package ID:
```bash
0x0654b03b81a62be3fdc44e7bcffd6a5f4969ddde8b06ac4c546d49ae9ad92a90
```
