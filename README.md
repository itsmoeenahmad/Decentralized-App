# Decentralized-App

A Flutter decentralized mobile app that connects to a local Ethereum blockchain (Ganache) using the `web3dart` package. This app demonstrates how to read and update a smart contract stored integer value directly from a mobile app interface.

---

## Overview

This project is a simple Flutter DApp (Decentralized Application) that interacts with an Ethereum smart contract deployed on a local Ganache blockchain. The app allows you to:

- Connect to a local Ethereum blockchain
- Read an integer value stored in the smart contract
- Increment and Decrement the stored value on the blockchain
- Display the current value in a clean Flutter UI

---

## Features

- Connects to Ganache via RPC
- Uses `web3dart` for blockchain interaction
- Uses Flutter for UI
- Supports both iOS Simulator and Android Emulator (with appropriate RPC URLs)

---

## Prerequisites

- Flutter SDK installed on your machine
- Ganache installed and running locally ([Ganache GUI](https://trufflesuite.com/ganache/) or CLI)
- Basic knowledge of Ethereum smart contracts and Flutter

---

## How to Setup and Run the App

### 1. Start Ganache

- Launch Ganache on your machine.
- Create a new workspace or quick start.
- Note the RPC Server URL (usually `http://127.0.0.1:7545`).

### 2. Deploy Smart Contract

- Use Remix IDE to deploy your Solidity smart contract to the Ganache blockchain.
- Copy the deployed contract address.
- Export the contract ABI JSON file and save it in the `assets` folder of the Flutter project as `abi.json`.

> **Note:** The smart contract should have at least two functions:
> - `getValue()` to read the stored integer.
> - `setValue(uint)` to update the stored integer.

### 3. Configure Flutter App

- Open the Flutter project.
- In `web3Service.dart`, update the following:
  - `rpcUrl`: Use the correct RPC URL depending on your platform:
    - iOS Simulator / macOS: `http://127.0.0.1:7545`
    - Android Emulator: `http://10.0.2.2:7545`
  - `privateKey`: Use a private key from one of Ganache accounts for signing transactions.
  - `contractAddress`: Update with your deployed contract address.

### 4. Run the App

- Run the Flutter app on your iOS Simulator or Android Emulator.
- The app will connect to Ganache, fetch the stored value, and display it.
- Use the **Increment** button to increase the value on the blockchain.
- Use the **Decrement** button to decrease the value on the blockchain.

---

## Important Notes

- The app communicates with the Ethereum blockchain using the HTTP RPC endpoint exposed by Ganache.
- Android emulator uses `10.0.2.2` to access localhost on the host machine because `127.0.0.1` inside the emulator points to the emulator itself, not the host.
- iOS simulator can access the host machine’s localhost directly using `127.0.0.1`.
- If you update the contract directly via Remix or any other client, the app will reflect the updated state on the next data fetch.

---

## Packages Used

- [`web3dart`](https://pub.dev/packages/web3dart): To interact with Ethereum blockchain and smart contracts.
- [`http`](https://pub.dev/packages/http): For making HTTP calls to the RPC endpoint.
- [`flutter/services.dart`](https://api.flutter.dev/flutter/services/services-library.html): To load the ABI JSON file from assets.

---

## Folder Structure

assets/
└── abi.json # Contract ABI file
lib/
├── Screens/
│ └── homeScreen.dart # UI and state management
├── Services/
│ └── web3Service.dart # Web3 client and contract interaction
└── main.dart # App entry point


---

## How it Works

1. **Initialization**: The app initializes the Web3 client and loads the smart contract ABI and address.
2. **Fetch Data**: On startup, the app calls the `getValue` function of the contract to fetch the current stored integer.
3. **Display Data**: The value is displayed on the app screen.
4. **Update Data**: When the user taps the **Increment** or **Decrement** button, the app sends a signed transaction calling the `setValue` function with the incremented/decremented integer.
5. **Update UI**: After the transaction is confirmed, the app fetches the new value and updates the UI.

---

## Contribution

Feel free to fork, raise issues, or submit pull requests!

---

## License

MIT License

---

## Contact

For questions or feedback, please reach out at itsmoeenahmad@gmail.com



