pragma solidity 0.4.15;


/// Error pattern is used to inform clients (web3, other smart contracts) on "business logic" errors
/// You should still use require() for input validation/access control
contract ReturnsErrors {

    ////////////////////////
    // Types
    ////////////////////////

    enum Status {
        SUCCESS,
        NOT_ENOUGH_NEUMARKS_TO_UNLOCK, // investor didn't approve enough neumarks to be burned
        INSUFFICIENT_FUNDS // not enough funds on investors account (for example to invest in ICO)

        /// @dev Add your own
    }

    ////////////////////////
    // Events
    ////////////////////////

    event LogError(
        Status code
    );

    ////////////////////////
    // Public functions
    ////////////////////////

    /// Example usage:
    ///
    /// if(msg.value < expected)
    ///     return logError(Status.Status);
    ///

    function logError(Status code)
        internal
        returns (Status)
    {
        LogError(code);
        return code;
    }
}
