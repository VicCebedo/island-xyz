pragma solidity ^0.5.10;

import "./CharacterService.sol";

contract FoeFactory is CharacterService {

    struct Foe {
        uint16 maxHealth;
        uint16 currentHealth;
        uint16 attack;
    }

    function generateRandomFoe(uint charId) internal view returns(Foe memory) {
        Character memory character = characters[charId];
        return Foe(character.maxHealth / 4, character.currentHealth / 4, character.attack / 4);
    }

}