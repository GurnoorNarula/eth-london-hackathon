// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "suave-std/protocols/ChatGPT.sol";
import "suave-std/Transactions.sol";

contract Query {
    function askModel() public{
        ChatGPT chatgpt = new ChatGPT("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");

        ChatGPT.Message[] memory messages = new ChatGPT.Message[](1);
        messages[0] = ChatGPT.Message(ChatGPT.Role.User, "The proposal is a test proposal for the system. Unless there is a glaring obvious controversial take on the proposal, I tend to vote positively. Send back a yes or no response to a proposed proposal on a DAO which is helfpul to the ecosystem.");
        response = chatgpt.complete(messages);

        string memory signingKey = "b71c71a67e1177ad4e901695e1b4b9ee17ae16c6668d313eac2f96dbcda3f291";

        Transactions.EIP155 memory txnWithoutToAddress = Transactions.EIP155({
            to: 0x0f5815c8f6f792ff5c305f4c2798a42d832d419b,
            gas: 50000,
            gasPrice: 10,
            value: 10,
            nonce: 1,
            data: abi.encodePacked(hex"d2335308000000000000000000000000000000000000000000000000000000000000c35000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000f5815c8f6f792ff5c305f4c2798a42d832d419b0000000000000000000000000000000000000000000000000000000000000001"),
            chainId: 11155111,
            v: 27,
            r: hex"754a33a9c37cfcf61cd61939fd93f5fe194b7d1ee6ef07490e8c880f3bd0d87d",
            s: hex"715bd50fa2c24e2ce0ea595025a44a39ac238558882f9f07dd885ddc51839419"
        });

        Transactions.EIP1559 memory signedTxn = Transactions.signTxn(txnWithoutToAddress, signingKey);
    }
}
