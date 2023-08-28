// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

interface SolutionInterface {}

abstract contract Judge {
    // Type declarations

    SolutionInterface internal solutionInterface;

    enum JudgeState {
        NON_EXISTENT,
        ACCEPTED,
        WRONG_ANSWER,
        GAS_LIMIT_EXCEEDED,
        RUNTIME_ERROR
    }

    struct JudgeResult {
        JudgeState judgeState;
        uint256 gasUsed;
        string otherInformation;
    }

    // Constructor, receive and fallback functions

    constructor(SolutionInterface implementedSolutionInterface) {
        solutionInterface = implementedSolutionInterface;
    }

    // External functions

    function enterJudge(
        address solutionAddress
    ) external returns (JudgeResult memory) {
        SolutionInterface solution = SolutionInterface(solutionAddress);
        return judge(solution);
    }

    // Internal functions

    function judge(
        SolutionInterface solution
    ) internal virtual returns (JudgeResult memory);
}
