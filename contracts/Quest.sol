pragma solidity ^0.5.10;

import "./CharacterService.sol";
import "./FoeFactory.sol";

contract Quest is CharacterService, FoeFactory {

    event BattleWin(uint characterId);
    event BattleLoss(uint characterId);

    function newQuest() external {

        // When you go to a quest,
        // there is a chance of random foe encounter.
        // TODO: Implement random chance.
        bool isRandomFoe = true;

        if(isRandomFoe) {
            _randomFoe();
        } else {

            // Other possibilities:
            // Item, healer, cave(?), portal(?).
            // Jejemon boss Marlou??
        }
    }

    /* Random encounter. */
    function _randomFoe() private {

        // Foe will depend on character's attributes.
        // Get the character of current player.
        uint charId = getCharacterIdByCurrentUser();
        Character storage character = characters[charId];
        Foe memory foe = generateRandomFoe(charId);
        
        // If the character wins.
        bool win = character.attack >= foe.attack;
        if (win) {
            character.level++;
            emit BattleWin(charId);
        } else {
            // Else, he loses.
            character.level--;
            emit BattleLoss(charId);
        }
    }
}