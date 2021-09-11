// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ExquisiteCorpse {
  constructor() public {
  }

  // Store whether a given address has made a contribution
  mapping (address => bool) public contrib;

  // An array of strings to store the full story
  string[] fullStory;

  // Add a section
  function addSection(string memory _value) public {
    // TODO: Only allow user to add a section if they've read the last section
    fullStory.push(_value);

    // Remember that this user has contributed
    contrib[msg.sender] = true;
  }

  // Show the last section so you know what to write next.
  function readLastSection() public view returns (string memory) {
    // TODO: This should trigger a (time-bound?) "reservation" where only the
    // last person to have read this can add a new section.
    require(fullStory.length > 0, "The story hasn't started yet.");
    return fullStory[fullStory.length - 1];
  }

  // Return the full Exquisite Corpse
  function readAll() public view returns (string memory) {
    // Don't let someone read the full story unless they've contributed
    require(contrib[msg.sender], "You have to contribute before you can read the whole thing.");

    string memory fullStoryString = "";
    string memory joiner = "";

    for (uint i = 0; i < fullStory.length; i++) {
      if (i > 0) joiner = "/ ";
      fullStoryString = string(abi.encodePacked(fullStoryString, joiner, fullStory[i]));
    }

    return fullStoryString;
  }
}
