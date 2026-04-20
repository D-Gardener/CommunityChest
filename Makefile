-include .env
export 

-PHONY: deploy test

RPC_URL := $(RPC_URL)
PRIVATE_KEY := $(PRIVATE_KEY)

deploy:
	forge script script/DeployCommunityChest.s.sol:DeployCommunityChest --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY) --broadcast

test-anvil:
	anvil --fork-url $(RPC_URL) &
	sleep 1
	forge test -vvv --rpc-url $(RPC_URL)