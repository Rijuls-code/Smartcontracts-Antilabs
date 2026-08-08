// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FinalContracts {
    address public immutable owner;
    bool public finalized;

    event ContractFinalized(address indexed finalizedBy, uint256 timestamp);

    error NotOwner();
    error AlreadyFinalized();

    constructor() {
        owner = msg.sender;
    }

    function finalize() external {
        if (msg.sender != owner) revert NotOwner();
        if (finalized) revert AlreadyFinalized();

        finalized = true;
        emit ContractFinalized(msg.sender, block.timestamp);
    }
}
