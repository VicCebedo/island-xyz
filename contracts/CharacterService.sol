pragma solidity ^0.5.10;

contract CharacterService {

    event NewCharacter(uint characterId);

    // List of all characters.
    Character[] public characters;

    // Map of owner to character ID.
    mapping(address => uint) public ownerToCharacter;

    // Character data type.
    struct Character {
        uint16 level;
        uint16 maxHealth;
        uint16 currentHealth;
        uint16 attack;
    }

    constructor() public {
        // Test data.
        characters.push(Character(100, 999, 999, 999));
    }

    /* @return Character associated with the id. */
    function getCharacterIdByCurrentUser() internal view returns(uint){
        return ownerToCharacter[msg.sender];
    }

    /* Create a new character. */
    function createNewCharacter() external {
        uint characterId = characters.push(Character(1, 100, 100, 10));
        ownerToCharacter[msg.sender] = characterId;
        emit NewCharacter(characterId);
    }

}