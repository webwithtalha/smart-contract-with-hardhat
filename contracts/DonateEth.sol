pragma solidity ^0.8.17;

contract DonateEth {
    struct Donation {
        address donor;
        string name;
        string message;
        uint256 timestamp;
    }

    mapping(address => uint256) public userDonations; // 1.
    uint256 public totalDonations; // 2.
    uint256 public totalEtherDonated; // 2.
    Donation[] public donations;
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function donate(string memory name, string memory message) public payable {
        require(msg.value > 0, "You must send some Ether");
        require(msg.sender != owner, "The owner cannot make a donation"); // 7.
        userDonations[msg.sender] = block.timestamp;
        totalDonations++;
        totalEtherDonated += msg.value;
        owner.transfer(msg.value);
        donations.push(Donation(msg.sender, name, message, block.timestamp));
    }

    function getDonations() public view returns (Donation[] memory) {
        return donations;
    }
    
    function getTotalDonations() public view returns (uint256) {
        return totalDonations;
    }

    function getTotalEtherDonated() public view returns (uint256) {
        return totalEtherDonated;
    }

    function getUserDonations(address user) public view returns (uint256) {
        return userDonations[user];
    }

    function getUserDonationCount(address user) public view returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < donations.length; i++) {
            if (donations[i].donor == user) {
                count++;
            }
        }
        return count;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw funds");
        owner.transfer(address(this).balance);
    }
}


// // SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.17;

// contract DonateEth {
//     struct Donation {
//         address donor;
//         string name;
//         string message;
//         uint256 timestamp;
//     }

//     Donation[] donations;
//     address payable owner;

//     constructor() {
//         owner = payable(msg.sender);
//     }

//     function donate(string memory name, string memory message) public payable {
//         require(msg.value > 0, "You must send some Ether");
//         owner.transfer(msg.value);
//         donations.push(Donation(msg.sender, name, message, block.timestamp));
//     }

//     function getDonations() public view returns (Donation[] memory) {
//         return donations;
//     } 

// }



