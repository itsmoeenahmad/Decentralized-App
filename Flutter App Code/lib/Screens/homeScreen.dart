import 'package:flutter/material.dart';
import '../Services/web3Service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Web3Services File - Instance
  final Web3Service _web3 = Web3Service();


  int _value = 0; // For holding the current value of the smart contract
  bool _loading = true; // For Loading

  // Execute only first time for initializing the smart contract.
  @override
  void initState() {
    super.initState();
    _web3.init().then((_) async {
      var val = await _web3.getStoredValue();
      setState(() {
        _value = val.toInt();
        _loading = false;
      });
    });
  }

  void _incrementValue() async {
    setState(() => _loading = true);
    await _web3.setStoredValue(_value + 1);
    var newVal = await _web3.getStoredValue();
    setState(() {
      _value = newVal.toInt();
      _loading = false;
    });
  }

  void _decrementValue() async {
    setState(() => _loading = true);
    await _web3.setStoredValue(_value - 1);
    var newVal = await _web3.getStoredValue();
    setState(() {
      _value = newVal.toInt();
      _loading = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
          backgroundColor:  Colors.white,
          title: Center(
            child: Text('Flutter + Web3',style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: Colors.black
            ),),
          )),
      body: Center(
        child: _loading
            ? CircularProgressIndicator(
          color: Colors.black,
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stored Value: $_value',style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.black
            ),),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _incrementValue, child: Text('Increment',style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.black
            ),)),
            SizedBox(height: 5),
            ElevatedButton(
                onPressed: _decrementValue, child: Text('Decrement',style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.black,
            ),))
          ],
        ),
      ),
    );
  }
}
