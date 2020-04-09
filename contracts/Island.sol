pragma solidity ^0.5.10;

import "./RandomHelper.sol";
import "./CharacterService.sol";
import "./SafeMath.sol";

contract Island is CharacterService, RandomHelper {

    using SafeMath16 for uint16;

    // Game is set in an island.
    // Island has:
    // Town, cave, etc.

    function goToCave() external {

        uint charId = getCharacterIdByCurrentUser();
        Character storage character = characters[charId];

        // When you go to a cave,
        // there is a chance of a treasure chest or random foe.
        uint chanceOfTreasureChest = 30;
        uint random = randomNumber(100);

        // If treasure chest, character gains free attack points.
        // TODO: (Need to change, give them gold coins).
        if (random <= chanceOfTreasureChest) {
            character.attack = character.attack.add(1);
        } else {

            // Else, random foe.
        }
        

    }
}