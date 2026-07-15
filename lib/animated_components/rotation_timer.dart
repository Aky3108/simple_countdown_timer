import 'package:flutter/material.dart';

/// Digits spin: new value rotates and fades in while old value spins out.
class RotationTimer extends StatelessWidget {
  const RotationTimer({
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
        return RotationTransition(
          turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
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
