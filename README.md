# An Extremely Simple Solidity Contract Development Workflow

## Running a Solidity Contract on Truffle

1. Install truffle: `npm install -g truffle`

1. Create a new truffle project

	1. In an empty directory run: `truffle init`

1. In `truffle-config.js`, uncomment the `development` network and change its port to `9545` (the port used for `truffle develop`)

1. Write a new contract in `./contracts`, something like
`./contracts/WriteAndRead.sol`

1. Add a new migration file for deployment at `./migrations/2_deploy_contracts.js`:

	```
	var WriteAndRead = artifacts.require("WriteAndRead");
	module.exports = function(deployer) {
		deployer.deploy(WriteAndRead);
	};
	```

1. Run `truffle develop` to start the local blockchain and enter the truffle console

1. Run `truffle migrate --network development` to compile and deploy your contract onto your local blockchain

1. Do something like `let instance = await WriteAndRead.deployed()`

1. Run one of your contract's transactions with something like
`instance.writeUint(1234)`

1. Run one of your contract's calls with something like `instance.getUint()`

1. Type `.exit` to leave the truffle console

## References:

These links are of varying quality but I probably got a tidbit out of each of
them since I have them all open in tabs right now:

- https://stackoverflow.com/questions/57076509/how-to-pass-a-string-to-a-setter-function-in-solidity
- https://www.tutorialspoint.com/solidity/solidity_strings.htm
- https://docs.soliditylang.org/en/v0.8.7/types.html
- https://www.trufflesuite.com/docs/truffle/getting-started/interacting-with-your-contracts
- https://www.trufflesuite.com/tutorial
- https://medium.com/solidify/how-to-setup-your-local-solidity-development-environment-c4c8195810f3
- https://ethereum.stackexchange.com/questions/73756/error-helloworld-has-not-been-deployed-to-detected-network-network-artifact-mi
- https://trailheadtechnology.com/solidity-development-setting-up-environment/
- https://www.quicknode.com/guides/web3-sdks/how-to-setup-local-development-environment-for-solidity
