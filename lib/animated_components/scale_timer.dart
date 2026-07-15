import 'package:flutter/material.dart';

/// Digits pop: new value scales up from 0 with a bounce while the old
/// value fades away.
class ScaleTimer extends StatelessWidget {
  const ScaleTimer({
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
      switchInCurve: Curves.elasticOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
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
