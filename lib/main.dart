import 'package:flutter/material.dart';
import 'package:countdown_utility/countdown_utility.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleCountdownPage(),
    );
  }
}

class SimpleCountdownPage extends StatelessWidget {
  const SimpleCountdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Countdown Utility",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: CircularCountdownTimer(
          hours: 0,
          minutes: 0,
          seconds: 10,
          size: 220,
          strokeWidth: 10,
          normalColor: Colors.blue,
          lowTimeColor: Colors.red,
          lowTimeInSeconds: 5,
        ),
      ),
    );
  }
}
