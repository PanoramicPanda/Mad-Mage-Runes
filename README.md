# Mad Mage Runes

This repo contains compilation of simple scripts to use alongside the D&D 5th Edition module **Dungeon of the Mad Mage**.
They generate what Elder Runes are on which gates, which player gets targeted, and how many days it 
takes Halaster before he notices and casts a new one.

## Scripts

  * **protect_undermountain.rb** - Generates all the basic choices for all gates within
  Undermountain.
  * **protect_entire_level.rb** - Casts runes for all gates on a given floor.
  * **protect_single_gate.rb** - Simple script to recast a single gate.
  
## Script Options
The scripts have some basic options to weight both rune and recast generation.
Below are their names, values, and functionality.

  * `easy_start: false` - Weights higher levels more towards Boon.
  * `hard_finish: false` - Weights lower levels more towards Bane.
  * `awareness: false` - The lower the number, the more aware Halaster is of the gate
  needing a rune recast and will likely take shorter to do so. (Generates a random number
    between 0 and awareness.)
  * `fudge: false` - Can be set to `'bane'` or `'boon'` to fudge the resulting rune type.
  * `party_size: 4` - Sets size of party, used to determine which person gets affected.
  * `current_level: false` - Set to current level when using `protect_entire_level.rb`. Tells the
    script which level to populate. 

## How to Run

No gems are needed to install, just simply run the scripts in your favorite Ruby runner!
