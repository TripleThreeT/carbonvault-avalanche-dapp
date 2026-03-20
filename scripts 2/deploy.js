const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying with account:", deployer.address);

  const Token = await ethers.getContractFactory("CarbonCreditToken");
  const token = await Token.deploy();
  await token.waitForDeployment();
  console.log("CarbonCreditToken deployed to:", await token.getAddress());

  const Registry = await ethers.getContractFactory("CarbonRegistry");
  const registry = await Registry.deploy(await token.getAddress());
  await registry.waitForDeployment();
  console.log("CarbonRegistry deployed to:", await registry.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
