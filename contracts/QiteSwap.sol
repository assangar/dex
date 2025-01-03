// SPDX-License-Identifier: GPL-3.0
//https://www.youtube.com/watch?v=RQzuQb0dfBM&t=60s
//https://www.youtube.com/watch?v=-YW2h8iYrYw&list=PLWUCKsxdKl0oksYr6IG_wRsaSUySQC0ck&index=7


pragma solidity >=0.7.0 <0.9.0;
import "./QitePool.sol";

//Creating a contract
contract QiteSwap {
    //State variables for liquidity pool addresses 
    address[] public allPairs; //allPair address that are present in the contract

    //Mapping (key_type => value_type)
    mapping(address => mapping(address => QitePool)) public getPair; //Mapping the address of the first token as a key and as a value a mapping to the address of the second token and return the liquidity pool

    //Event
    event PairCreated(address indexed _token1, address indexed _token2, address pair);

    //Create function to create Liquidity pool
    function createPairs(address _token1, address _token2, string calldata token1Name, string calldata token2Name) external returns (address) {
        require(_token1 != _token2, "Identical address is not allowed");
        require(address(getPair[_token1][_token2]) == address(0), "Pair already exists");

        //Create an object of QitePool
        QitePool qitePool = new QitePool(_token1, _token2);
        getPair[_token1][_token2] = qitePool;
        getPair[_token2][_token1] = qitePool; //Just to make sure the pairs don't get created a second time
        allPairs.push(address(qitePool));
        
        return address(qitePool);

        //Emit an event 
        emit PairCreated(_token1, _token2, address(qitePool)); //everyone can scan smart contract and check about even PairCreated 

    }

    function allPairsLength() public view returns (uint) {
        return allPairs.length;
    }

    function getPairs() public view returns (address[] memory){
        return allPairs;
    }

    function getPairOnPosition(uint _position) public view returns (address){
        return allPairs[_position];
    }
 

}