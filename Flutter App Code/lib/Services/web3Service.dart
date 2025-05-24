import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Web3Service {

  // Required variables are:
  late Web3Client client;
  late DeployedContract contract;
  late ContractFunction getFunction;
  late ContractFunction setFunction;
  late EthereumAddress contractAddress;
  late Credentials credentials;

  // Get the rpcURL from the Ganache & the private key is the Ganache account key which is connected with smart
  // contract using metamask
  //final String rpcUrl = "http://127.0.0.1:7545"; // Only for IOS Simulator & MacOS
  final String rpcUrl = "http://10.0.2.2:7545";// Only for Andriod Emulator because it is a virtual device running on another
  // machine not on current one(MacOS)
  final String privateKey = "0x9140a39ab4f1d41d4026e1f02c53f04426c2679aa24f86e373848deca52a7f72";

  // Function for connecting with blockchain & smart contract
  Future<void> init() async {
    client = Web3Client(rpcUrl, Client());

    String abiString = await rootBundle.loadString("assets/abi.json");
    var abiJson = jsonDecode(abiString);
    contractAddress = EthereumAddress.fromHex("0xf7c0ff209927494e5f591bc7cf5367a7215947d2");

    credentials = EthPrivateKey.fromHex(privateKey);

    //Loading the contract using ABI & contract_address
    contract = DeployedContract(
        ContractAbi.fromJson(jsonEncode(abiJson), "SimpleContract"), // In the string mention your smart contract name
        contractAddress);

    // Defining the contract functions. In string make sure write down the name of the functions correctly.
    getFunction = contract.function("getValue");
    setFunction = contract.function("setValue");
  }

  // Function For loading the stored value from the smart contract
  Future<BigInt> getStoredValue() async {
    var result = await client.call(
      contract: contract,
      function: getFunction,
      params: [], // No parameters.
    );
    return result.first as BigInt;
  }

  // Function For setting the stored value from the smart contract
  Future<String> setStoredValue(int val) async {
    var result = await client.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: setFunction,
        parameters: [BigInt.from(val)], // With parameters -- passing the new value
      ),
      chainId: 1337, // For Local Ganache
    );
    return result;
  }
}
