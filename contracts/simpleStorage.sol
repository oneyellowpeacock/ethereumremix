// SPDX-License-Identifier: MIT
pragma solidity 0.8.8; // 0.8.12 is latest but 0.8.8 is more stable
 

 contract simpleStorage {
     // boolean, uint, int, address, bytes
     // bool hasFavoriteNumber = true;
     // string favoriteNumberInText = "Five";
     // int256 favoriteInt = -5;
     // address myAddress = 0x42B8a2CFD1950eB969B1Ba716D2136Ce8C356aAB;
     // bytes32 favoriteBytes = "cat"; 
     
     // This gets initialised to zero!
      uint256 favoriteNumber;

      mapping(string => uint256) public nameToFavoriteNumber;

      struct People {
          uint256 favoriteNumber;
          string name;
      }

       // People public person = People({favoriteNumber: 69, name: "chad"});
       // uint256[] public favoriteNumbersList;
       People[] public people;


      function store(uint256 _favoriteNumber) public virtual {
          favoriteNumber = _favoriteNumber; 
      }

      // view,pure
      function retrieve() public view returns(uint256) {
          return favoriteNumber;
      }

      // calldata, memory, storage
      // calldata and memory are used if variable is needed only during the function
      // calldata temporary variables that can't be modified 
      // memory temporary variables that can be modified
      // storage variable exists even outside the fuction calling. EG line 14: favoriteNumber is storage variable

      function addPerson(string memory _name, uint256 _favoriteNumber) public {
          // people.push(People(_favoriteNumber,_name)); OR
          People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
          people.push(newPerson);
          nameToFavoriteNumber[_name] = _favoriteNumber;

      }

 }