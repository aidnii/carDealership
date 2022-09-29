// SPDX-License-Identifier: MIT

/// @title A title that should describe the contract/interface
/// @author The name of the author
/// @notice Explain to an end user what this does
/// @dev Explain to a developer any extra details

/// Logic 
// Car seller deploys the contract
// Car seller sets the price of the car
// Car seller sends ether to the smart contract

// car seller can suspend the transaction

// Car buyer sends ether to the smart contract
// Car seller ships car to the car buyer

// Car buyer must confirm after receiving the car
// Car dealership releases ether back to the seller 

pragma solidity ^0.8.16;

contract CarDealer {
    
    // state variables
    address payable public carSeller;
    address payable public carBuyer;
    uint public carPrice;

    // error handlers
    error OnlyBuyer();
    error OnlySeller();
    error InvalidState();

    modifier onlyBuyers() {
        if (msg.sender != carBuyer)
        revert OnlyBuyer();
        _;
    }

    modifier onlySeller() {
        if (msg.sender != carSeller)
            revert OnlySeller();
        _;
        
    }

    modifier correctStatus(CarStatus _carStatus) {
        if (carStatus != _carStatus)
            revert InvalidState();
        _;
    }

    // state of the car status
    enum CarStatus { Created, Locked, Release, Closed }
    CarStatus public carStatus;

    // constructor
    constructor() payable {
        carSeller = payable(msg.sender);
        carPrice = msg.value / 3;
    }

    // function suspend
    // function purchase
    // function confirmation
    // function refund

}