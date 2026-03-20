// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./CarbonCreditToken.sol";

contract CarbonRegistry is Ownable {
    CarbonCreditToken public token;

    struct CreditProject {
        string projectId;
        uint256 vintage;
        uint256 co2eAmount;
        bool validated;
    }

    mapping(uint256 => CreditProject) public projects;
    uint256 public projectCount;

    event ProjectRegistered(uint256 projectId, string name, uint256 vintage, uint256 co2e);

    constructor(address _tokenAddress) Ownable(msg.sender) {
        token = CarbonCreditToken(_tokenAddress);
    }

    function registerProject(string memory _projectId, uint256 _vintage, uint256 _co2eAmount) public onlyOwner {
        projectCount++;
        projects[projectCount] = CreditProject({
            projectId: _projectId,
            vintage: _vintage,
            co2eAmount: _co2eAmount,
            validated: true
        });

        emit ProjectRegistered(projectCount, _projectId, _vintage, _co2eAmount);
        token.mint(msg.sender, _co2eAmount, projectCount);
    }

    function getProject(uint256 _projectId) public view returns (string memory, uint256, uint256, bool) {
        CreditProject memory p = projects[_projectId];
        return (p.projectId, p.vintage, p.co2eAmount, p.validated);
    }
}
