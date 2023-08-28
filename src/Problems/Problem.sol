// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Judge, JudgeResult} from "../Judges/Judge.sol";

abstract contract Problem {
    // Errors
    error Problem__UnauthorizedAction();
    error Problem__JudgeNotBond();

    // Type declarations

    enum ProblemType {
        NON_EXISTENT,
        TRADITIONAL,
        INTERACTIVE
    }

    struct Submission {
        address submitterAddress;
        address solutionAddress;
        uint256 timestamp;
        JudgeResult judgeResult;
    }

    // State variables

    address[] public s_authorizedEditorList;

    ProblemType public s_problemType;
    string public s_title;
    string public s_contentUri;
    uint256 public s_gasLimit;
    Submission[] public s_submissions;

    Judge public s_bondJudge;

    // Modifiers

    modifier onlyIfAuthorized() {
        bool isAuthorized = false;
        for (uint256 i = 0; i < s_authorizedEditorList.length; i++) {
            if (s_authorizedEditorList[i] == msg.sender) {
                isAuthorized = true;
                break;
            }
        }
        if (isAuthorized == false) {
            revert Problem__UnauthorizedAction();
        }
        _;
    }

    modifier onlyIfJudgeHasBeenBond() {
        if (address(s_bondJudge) == address(0)) {
            revert Problem__JudgeNotBond();
        }
        _;
    }

    // Events

    event newSubmission(address submitterAddress, address solutionAddress);

    // Constructor, receive and fallback functions

    constructor(
        ProblemType problemType_,
        string memory title_,
        string memory contentUri_,
        uint256 gasLimit_
    ) {
        s_problemType = problemType_;
        s_authorizedEditorList.push(msg.sender);
        s_title = title_;
        s_contentUri = contentUri_;
        s_gasLimit = gasLimit_;
        s_submissions = new Submission[](0);
    }

    // External functions

    function submitSolution(address solutionAddress) external {}

    function bindJudge(address judgeAddress) external onlyIfAuthorized {
        s_bondJudge = Judge(judgeAddress);
    }

    function addAuthorizedEditor(
        address editorAddress
    ) external onlyIfAuthorized {
        s_authorizedEditorList.push(editorAddress);
    }

    // Getter functions

    function getTitle() public view returns (string memory) {
        return s_title;
    }

    function getContentUri() public view returns (string memory) {
        return s_contentUri;
    }

    function getGasLimit() public view returns (uint256) {
        return s_gasLimit;
    }

    function getSubmissionNumbers() public view returns (uint256) {
        return s_submissions.length;
    }

    function getSubmission(
        uint256 index
    ) public view returns (Submission memory) {
        return s_submissions[index];
    }

    function getBondJudgeAddress() public view returns (address) {
        return address(s_bondJudge);
    }
}
