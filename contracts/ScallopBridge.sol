// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

interface IScallopToken {
    function deposit(address user, uint256 amount) external;
}

contract ScallopBridge is Pausable, Ownable {
    address public _depositAdmin;
    address private _bscScallopToken;

    event Bridged(
        bytes indexed txHash,
        address indexed account,
        uint256 amount
    );

    constructor(address bscScallopToken_) {
        _bscScallopToken = bscScallopToken_;
    }

    modifier onlyDepositAdmin() {
        require(_msgSender() == _depositAdmin, "caller != depositAdmin");
        _;
    }

    function deposit(address _account, uint256 _amount)
        external
        whenNotPaused
        onlyDepositAdmin
    {
        IScallopToken(_bscScallopToken).deposit(_account, _amount);
    }

    function setDepositAdmin(address _newAdmin) external onlyOwner {
        _depositAdmin = _newAdmin;
    }

    // IMPLEMENT PAUSABLE FUNCTIONS
    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }
}
