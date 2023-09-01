// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {Problem} from "../src/Problems/Problem.sol";
import {QuickSortSolutionInterface, QuickSortJudge} from "../src/Judges/QuickSortJudge.sol";
import {QuickSortSolution} from "../src/Solutions/QuickSortSolution.sol";
import {MergeSortSolution} from "../src/Solutions/MergeSortSolution.sol";
import {BubbleSortSolution} from "../src/Solutions/BubbleSortSolution.sol";

contract DeployQuickSortProblem is Script {
    constructor() {}

    Problem sortProblem;
    QuickSortJudge judge;
    QuickSortSolution std;
    MergeSortSolution mergeSortSolution;
    BubbleSortSolution bubbleSortSolution;

    uint256 public length = 1000;
    uint256 public gasLimit = 1000000;

    string public problemContentUri = vm.readFile("./src/Problems/ProblemUri.txt");

    function run()
        external
        returns (Problem, QuickSortJudge, QuickSortSolution, MergeSortSolution, BubbleSortSolution)
    {
        std = new QuickSortSolution();
        mergeSortSolution = new MergeSortSolution();
        bubbleSortSolution = new BubbleSortSolution();
        judge = new QuickSortJudge(std, 10, 1000, gasLimit);
        sortProblem = new Problem(Problem.ProblemType.TRADITIONAL, "Quick Sort", problemContentUri, gasLimit);

        return (sortProblem, judge, std, mergeSortSolution, bubbleSortSolution);
    }
}
