// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {VestingContract} from "../lib/VestingContract.sol";

contract MarketingVesting is VestingContract {
    // 2 month cliff/linear release for 8 months (10 months total)
    constructor(
        address token,
        address beneficiary,
        address owner
    )
        VestingContract(
            token,
            beneficiary,
            owner,
            block.timestamp + 86400 * 30 * 2,
            0,
            86400 * 30 * 8
        )
    {}
}
