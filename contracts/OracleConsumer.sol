// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OracleConsumer {
    uint256 public carbonPrice; // price per ton in USD (mocked)
    event PriceUpdated(uint256 newPrice);

    constructor() {
        carbonPrice = 25; // start with $25/ton mock price
    }

    // Mock function - in real version this would call Chainlink
    function updatePrice(uint256 _newPrice) public {
        carbonPrice = _newPrice;
        emit PriceUpdated(_newPrice);
    }

    function getCarbonPrice() public view returns (uint256) {
        return carbonPrice;
    }
}
