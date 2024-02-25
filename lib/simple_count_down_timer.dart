import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_count_down_timer/animated_components/basic_timer.dart';

import 'animated_components/fade_in_timer.dart';

//ignore: must_be_immutable
class SimpleCountDownTimer extends StatefulWidget {
  ///sets the duration for the count down timer
  Duration duration;

  final TextStyle? textStyle;

  final AnimationStyle? animationStyle;

  SimpleCountDownTimer(
      {super.key,
      required this.duration,
      this.textStyle,
      this.animationStyle = AnimationStyle.fadeIn});

  @override
  State<SimpleCountDownTimer> createState() => _SimpleCountDownTimerState();
}

class _SimpleCountDownTimerState extends State<SimpleCountDownTimer> {
  var secondsString = "";
  var minutesString = "";
  var hoursString = "";
  var daysString = "";

  late Timer timer;
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if ((widget.duration - const Duration(seconds: 1)).isNegative == false) {
        widget.duration = widget.duration - const Duration(seconds: 1);
        updateTimerStrings();
      }
    });
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateTimerStrings() {
    setState(() {
      daysString = widget.duration.inDays.toString().padLeft(2, '0');
      hoursString =
          widget.duration.inHours.remainder(24).toString().padLeft(2, '0');
      minutesString =
          widget.duration.inMinutes.remainder(60).toString().padLeft(2, '0');
      secondsString =
          widget.duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        color: Colors.orangeAccent,
        child: widget.animationStyle == AnimationStyle.fadeIn
            ? FadeInTimer(
                daysString: daysString,
                hoursString: hoursString,
                minutesString: minutesString,
                secondsString: secondsString)
            : BasicTimer(
                daysString: daysString,
                hoursString: hoursString,
                minutesString: minutesString,
                secondsString: secondsString));
  }
}

enum AnimationStyle { fadeIn, basic }
