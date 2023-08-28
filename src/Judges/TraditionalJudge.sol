// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Judge, JudgeResult} from "./Judge.sol";

abstract contract ISolution {}

contract TraditionalJudgeResult is JudgeResult {
    enum TraditionalJudgeState {
        NON_EXISTENT,
        ACCEPTED,
        WRONG_ANSWER,
        GAS_LIMIT_EXCEEDED,
        RUNTIME_ERROR
    }
    TraditionalJudgeState public judgeState;
    uint256 public gasUsed;
    string public otherInformation;
}

abstract contract TraditionalJudge is Judge {
    // Type declarations

    enum JudgeState {
        NON_EXISTENT,
        ACCEPTED,
        WRONG_ANSWER,
        GAS_LIMIT_EXCEEDED,
        RUNTIME_ERROR
    }

    // Constructor, receive and fallback functions

    constructor() {}

    function enterJudge(
        address solutionAddress
    ) external override returns (JudgeResult) {
        ISolution solution = ISolution(solutionAddress);
        return begin(solution);
    }

    function begin(
        ISolution solution
    ) internal virtual returns (TraditionalJudgeResult) {
        TraditionalJudgeResult t = TraditionalJudgeResult();
    }
}
