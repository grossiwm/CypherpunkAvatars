// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {CypherpunkAvatars} from "../src/CypherpunkAvatars.sol";

contract CypherpunkAvatarsScript is Script {
    CypherpunkAvatars public token;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        token = new CypherpunkAvatars();

        vm.stopBroadcast();
    }
}
