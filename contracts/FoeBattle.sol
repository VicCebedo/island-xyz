pragma solidity ^0.5.10;

import "./CharacterService.sol";
import "./FoeFactory.sol";

contract FoeBattle is CharacterService, FoeFactory {

    /* @return True if the character won the battle. */
    function randomFoeBattle(uint charId) internal view returns(bool) {

        // Get character, get foe.
        Character storage character = characters[charId];
        Foe memory foe = generateRandomFoe(charId);

        // Actual battle.
        // TODO: Improve criteria for winning.
        bool win = character.attack >= foe.attack;

        // Return result of the battle.
        return win;
    }
}