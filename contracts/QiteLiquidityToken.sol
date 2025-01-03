// SPDX-License-Identifier: MIT
//https://www.youtube.com/watch?v=RQzuQb0dfBM&t=60s
//https://www.youtube.com/watch?v=-YW2h8iYrYw&list=PLWUCKsxdKl0oksYr6IG_wRsaSUySQC0ck&index=7

pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20.sol";


//Creating a contract
contract QiteLiquidityToken is ERC20 {
    constructor(string memory _name, string memory _symbol) ERC20(_name,_symbol){

    }

    function mint(address to, uint amount) external{
        _mint(to,amount); //inherited function from ERC20
    }

}