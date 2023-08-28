// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Problem} from "./Problem.sol";

abstract contract TraditionalProblem is Problem {
    constructor() {}

    function submitHack(
        address targetSolutionAddress,
        address hackContractAddress
    ) external virtual;
}
