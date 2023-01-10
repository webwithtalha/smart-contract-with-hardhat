import { ethers } from "hardhat";

async function main() {
  // We get the contract to deploy
  const DonateEth = await ethers.getContractFactory("DonateEth");
  const Donate = await DonateEth.deploy();

  await Donate.deployed();

  console.log("Greeter deployed to:", Donate.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
