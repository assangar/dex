// SPDX-License-Identifier: MIT
//https://www.youtube.com/watch?v=RQzuQb0dfBM&t=60s
//https://www.youtube.com/watch?v=-YW2h8iYrYw&list=PLWUCKsxdKl0oksYr6IG_wRsaSUySQC0ck&index=7

pragma solidity >=0.7.0 <0.9.0;
import "./QiteLiquidityToken.sol";

//Creating a contract
contract QitePool {

    //Tokens to Swap
    address public token1;
    address public token2;

    //Amount that is present in liquidity pool
    uint256 public reserve1;
    uint256 public reserve2;

    //Constant Market Maker function: x*y=k
    uint256 public constantK;

    //Token that will represent the liquidty that you hold in this liquidity pool
    QiteLiquidityToken public liquidityToken;

    //Token1 and Token2 need to be initialised 
    constructor(address _token1, address _token2){
        //require(_token1 != address(0));
        //require(_token2 != address(0));

        token1 = _token1;
        token2 = _token2;

        //Creation of QiteLiquidityToken
        liquidityToken = new QiteLiquidityToken();
    
    }

    //Function to add liquidty 
    function addLiquidity(uint amount_token1, uint amount_token2) public {
        //Create Liquidity token and deliver it to the liquidity provider -> We need the QiteLiquidityToken in order to mint the balance, etc.
        //Transfer amount of Token1 and Token2 inside this liquidity pool
        //Update reserve1 and reserve2 because we're adding new amounts of token in the liquidity pool
        //Update the constant formula because the (x) and (y) is now different and constant (k) needs to be updated

    }

 

}