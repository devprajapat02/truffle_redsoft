// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Cat is ERC20, Ownable {
    constructor() ERC20("Cat", "CAT") {
    }

    struct stakeData {
        address staker;
        uint256 amount;
        uint256 stakeTime;
    }

    uint256 public rewardRate = 2100;
    uint256 public testVal = 3000;

    mapping(address => stakeData) public stakeHistory;

    function testRead() public pure returns (uint256) {
        return 69;
    }

    function testWrite() public returns (uint256) {
        testVal += 1;
        return testVal;
    }

    function mint(uint256 amount) public {
        // convert amount ot wei
        amount = amount * 10 ** 18;
        _mint(msg.sender, amount);
    }

    function burn(address from, uint256 amount) public onlyOwner {
        // convert amount ot wei
        amount = amount * 10 ** 18;
        _burn(from, amount);
    }

    function stake(uint256 amount) public {
        // check if user has enough balance
        if (balanceOf(msg.sender) < amount) {
            revert("Not enough balance");
        }

        if (stakeHistory[msg.sender].staker != address(0)) {
            revert("Already staked");
        }
        // convert amount ot wei
        amount = amount * 10 ** 18;
        // _burn(msg.sender, amount);
        // send amount to contract
        _transfer(msg.sender, address(this), amount);
        stakeHistory[msg.sender] = stakeData(msg.sender, amount, block.timestamp);
    }

    function unstake() public {
        if (stakeHistory[msg.sender].staker == address(0)) {
            revert("Not staked");
        }

        stakeData memory data = stakeHistory[msg.sender];
        _transfer(address(this), msg.sender, data.amount);
        uint256 reward = (block.timestamp - data.stakeTime) * data.amount * rewardRate;
        reward = reward / 1000000000000000000;
        _mint(msg.sender, reward);
        delete stakeHistory[msg.sender];
    }

    function est_reward() public view returns (uint256) {
        stakeData memory data = stakeHistory[msg.sender];
        uint256 reward = (block.timestamp - data.stakeTime) * data.amount * rewardRate;
        reward = reward / 1000000000000000000;
        return (block.timestamp - data.stakeTime);
    }

    function get_stake_data (address staker) public view returns (stakeData memory) {
        return stakeHistory[staker];
    }
}