// Get funds from users
// Withdraw funds
// Set a minimum fund value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "./PriceConverter.sol";

error NotOwner();


contract FundMe{

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;
    // constant 21415 gas
    //non-constant 23515 gas

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;
    //immutable 21508 gas
    //non-immutable 23644 gas

    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable{ 
        // Want to vbe able to set a min fund value in USD
        // how do we send eth to this contract
        // msg.value.getConversionRate() is similar to getConversionRate(msg.value)

        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough"); //1e18 == 1*10**18 == 1000000000000000000
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;

    }

    function withdraw() public onlyOwner {

        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++ ){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset the array
        funders = new address[](0);

        //actually withdraw the funds
        //transfer
            // msg.sender = address
            // payable msg.sender = payable address
            // payable(msg.sender).transfer(address(this).balance);
        //send
            // bool sendSuccess = payable(msg.sender).send(address(this).balance);
            // require(sendSuccess, "Could not send");
        //call
            (bool callSuccess, /*bytes memory dataReturned  <-not necessary for now*/) = payable(msg.sender).call{value: address(this).balance}("");
            require(callSuccess,"Call failed");

    }


    modifier onlyOwner {
        // require(msg.sender == i_owner, "You are not Owner!");
        if (msg.sender != i_owner) { 
                revert NotOwner(); 
                }
        _;
    }

    //What happens if someone sends this contract without calling fund function

    receive() external payable {
        fund();
    }
    fallback() external payable {
        fund();
    }
}


