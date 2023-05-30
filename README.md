# Truffle Project README

This repository contains a Truffle project with a Solidity contract named `Cat.sol`. "CAT" is a self-made token using ERC20 standards.
The contract is deployed on Polygon Mumbai Testnet.

(Address: 0x32e2F17ef39636432c22A2dFb41C734402D2db77, RPC URL: "https://rpc-mumbai.maticvigil.com/").

To deploy the contract locally, follow the discussed process.

## Prerequisites

Before getting started, make sure you have the following prerequisites installed on your machine:

- Node.js (version 12 or later)
- Truffle (version 5.0.0 or later)
- Ganache CLI or Ganache GUI

## Installation

1. Clone this repository to your local machine:
   ```
   git clone https://github.com/devprajapat02/truffle_redsoft.git
   cd truffle_redsoft
   ```


## Contract

The contract `Cat.sol` represents a simple example contract named "Cat" with basic functionality.

## Compilation

To compile the Solidity contracts, run the following command:
```
(npx) truffle compile
```

This will compile the contracts and generate the corresponding artifacts in the `build/contracts` directory.

## Migration

Before migrating the contracts, make sure you have Ganache running either through the Ganache CLI or Ganache GUI.

To migrate the contracts to the local Ganache network, execute the following command:
```
(npx) truffle migrate
```

This will deploy the contracts to the Ganache network.

## Note

After successfully migrating the contracts, the deployment process will output the contract addresses. Look for the deployed contract address for the `Cat` contract in the console logs.

Make a note of the deployed contract address as you will need it for interacting with the contract in your dApp or other applications.

## Usage

You can now start using the deployed contract address to interact with the `Cat` contract in your dApp or other applications.

Feel free to modify the contract or develop additional functionality based on your requirements.

## Additional Resources

For more information about Truffle and its features, refer to the official Truffle documentation: [Truffle Documentation](https://www.trufflesuite.com/docs)

For ERC20 token standards and implementation details, refer to the official Ethereum EIP-20 documentation: [EIP-20: ERC-20 Token Standard](https://eips.ethereum.org/EIPS/eip-20)
