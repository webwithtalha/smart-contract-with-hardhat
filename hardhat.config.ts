import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.17",
  paths: {
    artifacts: "./artifacts",
  },
  networks: {
    bsc_testnet: {
      url: "https://data-seed-prebsc-1-s3.binance.org:8545/",
      accounts: [
        "e4fadea0dfb4f5ca011e868a5fe5a3e6f2dc70c861e0d2fa4a5b00012f53d289",
      ],
      chainId: 97,
    },
  },
};

export default config;
