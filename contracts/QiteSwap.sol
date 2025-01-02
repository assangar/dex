// SPDX-License-Identifier: MIT
//https://www.youtube.com/watch?v=RQzuQb0dfBM&t=60s
//https://www.youtube.com/watch?v=-YW2h8iYrYw&list=PLWUCKsxdKl0oksYr6IG_wRsaSUySQC0ck&index=7


pragma solidity >=0.7.0 <0.9.0;
import "contracts/QitePool.sol";

//Creating a contract
contract QiteSwap {
    //State variables for liquidity pool addresses 
    address[] public allPairs; //allPair address that are present in the contract

    //Mapping (key_type => value_type)
    mapping(address => mapping(address => QitePool)) public getPair; //Mapping the address of the firs token as a key and as a value a mapping to the address of the second token and return the liquidity pool

    //Create function to create Liquidity pool
    function createPairs(address _token1, address _token2, string calldata token1Name, string calldata token2Name) external returns (address) {
        require(_token1 != _token2, "Identical address is not allowed");
        require(address(getPair[_token1][_token2]) == address(0), "Pair already exists");

        //Create an object of QitePool
        QitePool qitePool = new QitePool();
        getPair[_token1][_token2] = qitePool;
        getPair[_token2][_token1] = qitePool; //Just to make sure the pairs don't get created a second time
        
    }

    

}