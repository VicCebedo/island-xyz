pragma solidity ^0.5.10;

import "./RandomHelper.sol";
import "./CharacterService.sol";
import "./SafeMath.sol";
import "./FoeBattle.sol";

contract Island is CharacterService, FoeBattle, RandomHelper {

    using SafeMath16 for uint16;

    event ViewBar();

    // Game is set in an island.
    // Island has:
    // Town, cave, etc.

    function goToBar() external {
        emit ViewBar();
    }

    modifier aboveLevel(uint _level, address _owner) {
        uint _charId = ownerToCharacter[_owner];
        require(characters[_charId].level >= _level);
        _;
    }

    // TODO: Transfer to UserBattle.sol.
    /* Only applicable for Level 10 and up. */
    function attackUser(uint _targetCharacterId) external view aboveLevel(10, msg.sender) returns(bool) {

        // You can attack other users.
        // Get my character.
        uint charId = getCharacterIdByCurrentUser();
        Character storage myChar = characters[charId];
        Character storage enemyChar = characters[_targetCharacterId];

        // TODO: Improve winning criteria.
        bool win = myChar.attack >= enemyChar.attack;
        return win;
    }

    function goToCave() external {

        uint chanceOfTreasureChest = 30;
        uint random = randomNumber(100);
        uint charId = getCharacterIdByCurrentUser();
        Character storage character = characters[charId];

        // When you go to a cave,
        // there is a chance of a treasure chest or random foe.
        if (random <= chanceOfTreasureChest) {

            // If treasure chest, character gains free attack points.
            // TODO: (Need to change, give them gold coins).
            character.attack = character.attack.add(1);
        } else {

            // Else, random foe.
            bool win = randomFoeBattle(charId);
            if (win) {
                character.level = character.level.add(1);           // Level up!
                character.maxHealth = character.maxHealth.add(1);   // Max level upgrade.
                character.currentHealth = character.maxHealth;      // Health replenish.
                character.attack = character.attack.add(1);         // Attack upgrade.
            } else {

                // If character loses, current health less 1.
                character.currentHealth = character.currentHealth.sub(1);
            }
        }
    }
}