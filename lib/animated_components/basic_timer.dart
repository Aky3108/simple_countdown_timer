import 'package:flutter/material.dart';

class BasicTimer extends StatelessWidget {
  const BasicTimer({
    super.key,
    required this.daysString,
    required this.hoursString,
    required this.minutesString,
    required this.secondsString,
    this.textStyle,
  });

  final String daysString;
  final String hoursString;
  final String minutesString;
  final String secondsString;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$daysString :",
          style: textStyle ??
              const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
        ),
        Text(
          "$hoursString : ",
          style: textStyle ??
              const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
        ),
        Text(
          "$minutesString : ",
          style: textStyle ??
              const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
        ),
        Text(
          secondsString,
          style: textStyle ??
              const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
