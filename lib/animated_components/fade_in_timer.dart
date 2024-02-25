import 'package:flutter/material.dart';

import '../text_animators/animated_fade_out_in.dart';

class FadeInTimer extends StatefulWidget {
  const FadeInTimer({
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
  State<FadeInTimer> createState() => _FadeInTimerState();
}

class _FadeInTimerState extends State<FadeInTimer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedFadeOutIn(
          data: widget.daysString,
          builder: (String data) {
            return Text(
              "$data :",
              style: widget.textStyle ??
                  const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
            );
          },
        ),
        AnimatedFadeOutIn(
          data: widget.hoursString,
          builder: (String data) {
            return Text(
              "$data : ",
              style: widget.textStyle ??
                  const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
            );
          },
        ),
        AnimatedFadeOutIn(
          data: widget.minutesString,
          builder: (String data) {
            return Text(
              "$data : ",
              style: widget.textStyle ??
                  const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
            );
          },
        ),
        AnimatedFadeOutIn(
          data: widget.secondsString,
          builder: (String data) {
            return Text(
              data,
              style: widget.textStyle ??
                  const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
            );
          },
        )
      ],
    );
  }
}
