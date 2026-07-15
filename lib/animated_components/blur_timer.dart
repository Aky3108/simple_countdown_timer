import 'dart:ui';

import 'package:flutter/material.dart';

/// Digits blur out and the new value sharpens into focus (soft focus-pull).
class BlurTimer extends StatelessWidget {
  const BlurTimer({
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
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, animation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            final blur = (1 - animation.value) * 6;
            return ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Opacity(opacity: animation.value, child: child),
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
