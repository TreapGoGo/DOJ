// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

abstract contract JudgeResult {}

abstract contract Judge {
    // Errors

    error Judge__ReceivedUnexpectedEther();

    // Constructor, receive and fallback functions

    constructor() {}

    receive() external payable {
        if (msg.value > 0) {
            revert Judge__ReceivedUnexpectedEther();
        }
    }

    fallback() external payable {
        if (msg.value > 0) {
            revert Judge__ReceivedUnexpectedEther();
        }
    }

    // External functions

    function enterJudge(
        address solutionAddress
    ) external virtual returns (JudgeResult);
}
