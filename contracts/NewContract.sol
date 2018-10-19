pragma solidity ^0.4.25;

contract NewContract {
    address public owner;
    string public name;
    
    constructor(address contractCreator, string providedName) public {
        owner = contractCreator;
        name = providedName;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
	
    function getValues() 
    external
    view
    onlyOwner
    returns (address, string) {
        return (
            owner,
            name
        );
    }
}