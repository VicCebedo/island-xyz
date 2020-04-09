pragma solidity ^0.5.10;

import "./ownable.sol";

contract Bar is Ownable {

    event TalkToBartender(string _greetings);
    event ReadRumor(string _rumor);

    string greetings = "Buy a rumor?";
    string rumor = "";
    uint rumorFee = 1.0 ether;

    constructor() internal {
        emit TalkToBartender(greetings);
    }
    
    // Buy the merchandise.
    function buyRumor() external payable {
        require(msg.value >= rumorFee);
        emit ReadRumor(rumor);
    }

    /*
    *
    * Bartender setters.
    *
    */

    function setGreetings(string calldata _greetings) external onlyOwner {
        greetings = _greetings;
    }

    function setRumorFee(uint _fee) external onlyOwner {
        rumorFee = _fee;
    }
    
    // TODO: Must get value from outside blockchain.
    function setRumor(string calldata _rumor) external onlyOwner {
        rumor = _rumor;
    }
}