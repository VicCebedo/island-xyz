pragma solidity ^0.5.10;

contract CharacterService {

    event NewCharacter(uint characterId);

    // List of all characters.
    Character[] public characters;

    // Map of owner to character ID.
    mapping(address => uint) public ownerToCharacter;

    // Character data type.
    struct Character {
        uint8 level;
        uint16 maxHealth;
        uint16 currentHealth;
        uint16 attack;
    }

    constructor() public {
    }

    /* Get character by current user. */
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