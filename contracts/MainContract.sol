pragma solidity ^0.4.25;

import "./NewContract.sol";

contract MainContract {
    address[] public contracts;
    address public lastContractAddress;
    address owner;
    
    event newContractCreated(
       address contractAddress
    );
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner Allowed");
        _;
    }

    constructor()
    public {
        owner = msg.sender;
    }

    function getContractCount()
    external
    view
    returns(uint contractCount) {
        return contracts.length;
    }

	// deploy a new contract
    // pass in info to create token
    // Name, Symbol, Decimals, Token supply,
    function createContract(string name, string symbol, uint8 decimals, uint256 totalSupply)
    external
    onlyOwner
    returns (address createNewContract) {
        NewContract c = new NewContract(msg.sender, name, symbol, decimals, totalSupply);
        contracts.push(c);
        lastContractAddress = address(c);
        emit newContractCreated(c);
        return c;
    }

	// Get contract address at position  
    function getContractAt(uint256 pos)
    public
    view
    returns(address contractAddress) {
        return contracts[pos];
    }
}