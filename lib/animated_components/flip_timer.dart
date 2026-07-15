import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Digits flip on the X axis (split-flap / flip-clock feel).
class FlipTimer extends StatelessWidget {
  const FlipTimer({
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

  TextStyle get _style =>
      textStyle ??
      const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

  Widget _unit(String value, String suffix) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            final angle = (1 - animation.value) * math.pi / 2;
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(angle),
              child: child,
            );
          },
        );
      },
      child: Text("$value$suffix", key: ValueKey(value), style: _style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _unit(daysString, " :"),
        _unit(hoursString, " : "),
        _unit(minutesString, " : "),
        _unit(secondsString, ""),
      ],
    );
  }
}
