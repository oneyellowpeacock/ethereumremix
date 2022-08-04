// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SafeMathTester{

    uint8 public bigNumber = 255;

    function add() public {
        unchecked {bigNumber = bigNumber+1;}
    }
}

// In solidity less thn 0.6 EG in uint8 means 255+1=0+1=1 and so on. it would wrap around. so there was safemath. after 0.8 no need
// but if still want to use that function thn can use unchecked{}