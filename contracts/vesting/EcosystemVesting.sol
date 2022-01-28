// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {VestingContract} from "../lib/VestingContract.sol";

contract EcosystemVesting is VestingContract {
    // Linear over 12 months
    constructor(
        address token,
        address beneficiary,
        address owner
    )
        VestingContract(
            token,
            beneficiary,
            owner,
            block.timestamp,
            0,
            86400 * 30 * 12
        )
    {}
}
