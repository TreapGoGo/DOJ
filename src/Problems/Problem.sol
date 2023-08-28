// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

abstract contract Problem {
    // Errors
    error Problem__ReceivedUnexpectedEther();

    // Type declarations

    struct Submission {
        address submitterAddress;
        address solutionAddress;
        uint256 timestamp;
    }

    // State variables

    string public _title;
    string public _contentUri;
    uint256 public _gasLimit;
    Submission[] public _submissions;

    // Constructor, receive and fallback functions

    constructor(string memory title_, string memory contentUri_) {}

    receive() external payable {
        if (msg.value > 0) {
            revert Problem__ReceivedUnexpectedEther();
        }
    }

    fallback() external payable {
        if (msg.value > 0) {
            revert Problem__ReceivedUnexpectedEther();
        }
    }

    // External functions

    function submitSolution(address solutionAddress) external virtual;

    // Getter functions

    function getTitle() public view returns (string memory) {
        return _title;
    }

    function getContentUri() public view returns (string memory) {
        return _contentUri;
    }

    function getGasLimit() public view returns (uint256) {
        return _gasLimit;
    }

    function getSubmissionNumbers() public view returns (uint256) {
        return _submissions.length;
    }

    function getSubmission(
        uint256 index
    ) public view returns (Submission memory) {
        return _submissions[index];
    }
}
