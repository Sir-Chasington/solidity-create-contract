pragma solidity ^0.4.25;

contract NewContract {
    address public owner;
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => uint256) internal balances;
    
    constructor(
        address contractCreator,
        string tokenName,
        string tokenSymbol,
        uint8 tokenDecimals,
        uint256 tokenTotalSupply
    ) public {
        owner = contractCreator;
        name = tokenName;
        symbol = tokenSymbol;
        decimals = tokenDecimals;
        totalSupply = tokenTotalSupply;
        balances[contractCreator] = tokenTotalSupply;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner Allowed");
        _;
    }
	
    function getValues() 
    external
    view
    onlyOwner
    returns (address, string, string, uint8, uint256) {
        return (
            owner,
            name,
            symbol,
            decimals,
            totalSupply
        );
    }

    function balanceOf(address addr)
    external
    view
    returns (uint256) {
        return balances[addr];
    }
}