import 'package:dapp/Screens/homeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter & Web3 ',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

