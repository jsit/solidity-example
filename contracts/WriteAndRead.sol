// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract WriteAndRead {
  constructor() public {
  }

  function writeString(string memory _value) public {
    stringValue = _value;
  }

  function readString() public view returns (string memory) {
    return stringValue;
  }

  function writeUint(uint _value) public {
    uintValue = _value;
  }

  function readUint() public view returns (uint) {
    return uintValue;
  }

  uint uintValue;
  string stringValue;
}
