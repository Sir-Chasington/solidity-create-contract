pragma solidity ^0.4.25;

import "./NewContract.sol";

contract MainContract {
    address[] public contracts;
    address public lastContractAddress;
    address owner;
    
    event newContractCreated(
       address contractAddress
    );
    
    modifier onlyOwner(address addr) {
        require(addr == owner);
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
    function createContract(string name)
    external
    onlyOwner(msg.sender)
    returns (address createNewContract) {
        NewContract c = new NewContract(msg.sender, name);
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
        return address(contracts[pos]);
    }
}