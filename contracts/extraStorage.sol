// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./simpleStorage.sol";

contract extraStorage is simpleStorage{

    // +5
    // override
    // to override you have to make the function virtual and thn add override where you are overriding

    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }


}