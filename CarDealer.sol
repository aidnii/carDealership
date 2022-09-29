// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract CarDealer {
    
    // state variables
    address payable public carSeller;
    address payable public carBuyer;
    uint public carPrice;

    // state of the car status
    enum CarStatus { Created, Locked, Release, Closed }
    CarStatus public carStatus;

    // constructor
    constructor() payable {
        carSeller = payable(msg.sender);
        carPrice = msg.value;
    }
}