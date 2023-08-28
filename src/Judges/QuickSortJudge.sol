/**
 * @title QuikeSortJudge
 * @author qpdk777
 * @notice All rights not reserved :)
 * @dev This is an example of DOJ judge implementation.
 *      In this file we implement SolutionInterface interface
 *      and judge function for a quick sort problem.
 */

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SolutionInterface, Judge} from "./Judge.sol";

interface QuickSortSolutionInterface is SolutionInterface {
    function run(uint256[] memory) external returns (uint256[] memory);
}

contract QuickSortJudge is Judge {
    // State Variables

    uint256 immutable i_testCaseNumber;
    uint256 immutable i_maximumListLength;
    uint256 immutable i_gasLimit;

    // Constructor function

    constructor(
        QuickSortSolutionInterface quickSortSolutionInterface,
        uint256 testCaseNumber,
        uint256 maximumListLength,
        uint256 gasLimit
    ) Judge(quickSortSolutionInterface) {
        i_testCaseNumber = testCaseNumber;
        i_maximumListLength = maximumListLength;
        i_gasLimit = gasLimit;
    }

    // Internal functions

    function judge(
        SolutionInterface solution
    ) internal override returns (JudgeResult memory) {
        for (uint256 i = 0; i < i_testCaseNumber; i++) {}
    }
}
