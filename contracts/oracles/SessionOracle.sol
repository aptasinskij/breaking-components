pragma solidity 0.4.24;

import "../platform/Named.sol";
import "../platform/Mortal.sol";
import "./api/ASessionOracle.sol";
import "../platform/Component.sol";
import "../managers/SessionManager.sol";

contract SessionOracle is ASessionOracle, Named("session-oracle"), Mortal, Component  {

    string constant MANAGER = "session-manager";

    constructor(address _config) Component(_config) public {}

    function onNextCloseSession(uint256 sessionId) public {
        emit CloseSession(sessionId);
    }

    function successClose(uint256 _sessionId) public {
        ASessionManager(context.get(MANAGER)).confirmClose(_sessionId);
    }

    function failClose(uint256 _sessionId) public {
        //TODO:implementation: add call to SessionManager::confirmFailClose
    }

}