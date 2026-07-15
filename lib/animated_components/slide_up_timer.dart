import 'package:flutter/material.dart';

/// Digits slide up: old value slides out the top, new value slides in
/// from the bottom (departure-board feel).
class SlideUpTimer extends StatelessWidget {
  const SlideUpTimer({
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
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        final inTween =
            Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
        return ClipRect(
          child: SlideTransition(
            position: animation.drive(inTween),
            child: child,
          ),
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
