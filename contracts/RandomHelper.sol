pragma solidity ^0.5.10;

import "./SafeMath.sol";

contract RandomHelper {

    using SafeMath for uint256;

    uint randNonce = 0;

    /* @return Random number from zero to 100. */
    function randomNumber(uint _mod) internal returns(uint) {
        randNonce = randNonce.add(1);
        return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _mod;
    }
}