const Cat = artifacts.require("Cat");

module.exports = function (deployer) {
    deployer.deploy(Cat);
}
