pragma solidity 0.4.15;

import './MigrationTarget.sol';


/// @notice implemented in the contract that is the target of LockedAccount migration
///  migration process is removing investors balance from source LockedAccount fully
///  target should re-create investor with the same balance, totalLockedAmount and totalInvestors are invariant during migration
contract LockedAccountMigration is
    MigrationTarget
{
    ////////////////////////
    // Events
    ////////////////////////

    /// @notice intended to be logged on successful migration
    event InvestorMigrated(
        address indexed investor,
        uint256 balance,
        uint256 neumarksDue,
        uint256 unlockDate,
        address assetToken
    );

    ////////////////////////
    // Public functions
    ////////////////////////

    // implemented in migration target, yes modifiers are inherited from base class
    function migrateInvestor(
        address investor,
        uint256 balance,
        uint256 neumarksDue,
        uint256 unlockDate
    )
        public
        onlyMigrationSource()
        returns(bool);
}
