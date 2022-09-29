// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

/// @custom:security-contact admin@utmswap.io
contract UTMDigitalAssets is ERC20, ERC20Burnable, ERC20Snapshot, Ownable, Pausable {
    constructor() ERC20("UTM Digital Assets", "UTM") {
        _mint(msg.sender, 110000000 * 10 ** decimals());
    }

    function snapshot() public onlyOwner {
        _snapshot();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
