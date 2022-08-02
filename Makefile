-include .env
export

SCRIPT_DIR = ./script

build:
	forge build

init:
	git submodule update --init --recursive
	forge install

test:
	forge test

trace:
	forge test -vvv
	
mainnet-deploy-simulation:
	$(foreach file, $(wildcard $(SCRIPT_DIR)/*.s.sol), forge script $(file) --rpc-url ${MAINNET_RPC_URL}  -vvvv;)

mainnet-deploy:
	$(foreach file, $(wildcard $(SCRIPT_DIR)/*.s.sol), forge script $(file) --rpc-url ${MAINNET_RPC_URL}  --private-key ${PRIVATE_KEY} --broadcast --verify --etherscan-api-key ${MAINNET_ETHERSCAN_KEY} -vvvv;)

.PHONY: build test