// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

interface ISolution {}

contract JudgeResult {
    enum JudgeState {
        NON_EXISTENT,
        ACCEPTED,
        WRONG_ANSWER,
        GAS_LIMIT_EXCEEDED,
        RUNTIME_ERROR
    }
    JudgeState public judgeState;
    uint256 public gasUsed;
    string public otherInformation;
}

abstract contract Judge {
    // Type declarations

    // Constructor, receive and fallback functions

    constructor() {}

    function enterJudge(
        address solutionAddress
    ) external returns (JudgeResult) {
        ISolution solution = ISolution(solutionAddress);
        return judge(solution);
    }

    function judge(ISolution solution) internal virtual returns (JudgeResult) {}
}
