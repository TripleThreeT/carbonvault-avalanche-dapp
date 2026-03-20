// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CarbonCreditToken is ERC20, Ownable {
    event CreditMinted(address indexed to, uint256 amount, uint256 projectId);
    event CreditRetired(address indexed from, uint256 amount);

    constructor() ERC20("CarbonCreditToken", "CCT") Ownable(msg.sender) {}

    function mint(address to, uint256 amount, uint256 projectId) public onlyOwner {
        _mint(to, amount);
        emit CreditMinted(to, amount, projectId);
    }

    function retire(uint256 amount) public {
        _burn(msg.sender, amount);
        emit CreditRetired(msg.sender, amount);
    }
}
