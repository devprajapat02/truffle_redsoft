const Cat = artifacts.require("Cat")
const { assert } = require("chai")

contract("Cat", (accounts) => {
    it ("should be able to mint new tokens and transfer them", async () => {
        const instance = await Cat.deployed()
        const balanceBefore = await instance.balanceOf(accounts[0]) / (10 ** 18)
        await instance.mint(1)
        const balanceAfter = await instance.balanceOf(accounts[0]) / (10 ** 18)
        console.log(balanceAfter)
        assert.equal(balanceAfter - balanceBefore, 1, `Balance increased by ${balanceAfter - balanceBefore}`)
    })

    it ("should be able to burn tokens", async () => {
        const instance = await Cat.deployed()
        const balanceBefore = await instance.balanceOf(accounts[0]) / (10 ** 18)
        await instance.burn(accounts[0], 1)
        const balanceAfter = await instance.balanceOf(accounts[0]) / (10 ** 18)
        console.log(balanceAfter)
        assert.equal(balanceBefore - balanceAfter, 1, `Balance decreased by ${balanceBefore - balanceAfter}`)
    })

    it ("should be able to stake and unstake tokens", async () => {
        const instance = await Cat.deployed()
        await instance.mint(5)
        await instance.stake(2)
        const balance = await instance.balanceOf(accounts[0]) / (10 ** 18)
        assert.equal(balance, 3, `Incorrect balance : ${balance}`)

        const stake = await instance.get_stake_data(accounts[0])
        assert.equal(stake.amount / (10 ** 18), 2, `Incorrect stake amount : ${stake.amount}`)
        console.log(stake)

        await new Promise(resolve => setTimeout(resolve, 10000))
        
        const reward = await instance.est_reward()
        console.log("reward", reward, "nano CAT")

        await instance.unstake()
        const ba = await instance.balanceOf(accounts[0]) / (10 ** 18)
        console.log(ba)
        const balanceAfter = await instance.balanceOf(accounts[0])/ (10 ** 18)
        assert.ok(balanceAfter > 5, `Incorrect balance after unstake : ${balanceAfter}`)
    })
})