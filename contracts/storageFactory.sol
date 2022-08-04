// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./simpleStorage.sol";

// Contracts interacting with each other is known as composability of the contracts

contract storageFactory{

    simpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        simpleStorage simStorage = new simpleStorage();   
        simpleStorageArray.push(simStorage);     

    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //Address
        //ABI - Application Bincary Interaface

        simpleStorage simStorage = simpleStorageArray[_simpleStorageIndex];
        simStorage.store(_simpleStorageNumber);

        //OR simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);

    }

    function sfget(uint256 _simpleStorageIndex) public view returns (uint256){
        
        simpleStorage simStorage = simpleStorageArray[_simpleStorageIndex];
        return simStorage.retrieve();

        // OR return simpleStorageArray[_simpleStorageIndex].retrive();

    }
}