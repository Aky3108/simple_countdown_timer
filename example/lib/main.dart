import 'package:flutter/material.dart';
import 'package:simple_count_down_timer/simple_count_down_timer.dart' as timer;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: timer.SimpleCountDownTimer(
            duration: const Duration(days: 1, seconds: 5),
            animationStyle: timer.AnimationStyle.fadeIn,
          ),
        ),
      ),
    );
  }
}
