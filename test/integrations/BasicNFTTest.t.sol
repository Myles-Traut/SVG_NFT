// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Test, console} from "forge-std/Test.sol";
import {DeployBasicNFT} from "../../script/DeployBasicNFT.s.sol";
import {BasicNFT} from "../../src/BasicNFT.sol";

contract BasicNFTTest is Test {
    DeployBasicNFT public deployer;
    BasicNFT public basicNFT;

    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    address public user = makeAddr("user");

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }

    function test_NameIsCorrect() public {
        string memory expectedName = "Doggies";
        string memory actualName = basicNFT.name();

        assertEq(keccak256(abi.encodePacked(expectedName)), keccak256(abi.encodePacked(actualName)));
    }

    function test_CanMintAndHaveCorrectURI() public {
        vm.prank(user);
        basicNFT.mint(PUG_URI);

        assertEq(basicNFT.tokenURI(0), PUG_URI);
        assertEq(basicNFT.balanceOf(user), 1);
    }
}
