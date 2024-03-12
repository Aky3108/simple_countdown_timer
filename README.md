# Flutter Countdown Timer Widget
This is a simple countdown timer widget built with Flutter. It displays the remaining time until a specified end date and time, and triggers a callback function when the countdown finishes.

## Features
*  Displays remaining time in days, hours, minutes, and seconds.
*  Customizable text styles and colors.
*  Callback function for when the countdown finishes.
*  Lightweight and easy to use.


## Installation
1. Add the dependency to your pubspec.yaml file:
```dependencies:
  simple_count_down_timer: ^1.0.4 # Replace with the latest version
```
2. Run flutter pub get to install the package.

## Usage
 ```import 'package:flutter/material.dart';
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
```

# Customization
* TextStyle: You can customize the text style of the countdown timer by setting the style property of the child widget.
* Colors: You can change the colors of the text and background by using a ThemeData with your desired colors.

# Additional Notes
This package is for simple countdown timers. For more advanced features like pausing, resuming, and complex formatting, consider exploring other timer packages available on pub.dev.
Make sure to replace ^1.0.4 with the latest version of the countdown_timer package in your pubspec.yaml file.



