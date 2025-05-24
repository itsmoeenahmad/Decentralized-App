// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract SimpleContract {
    uint256 storedValue;

    function setValue(uint256 x) public {
        storedValue = x;
    }

    function getValue() public view returns (uint256) {
        return storedValue;
    }
}
