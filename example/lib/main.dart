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
  timer.AnimationStyle _selectedStyle = timer.AnimationStyle.fadeIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Pick an animation style',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              DropdownButton<timer.AnimationStyle>(
                value: _selectedStyle,
                items: timer.AnimationStyle.values
                    .map(
                      (style) => DropdownMenuItem(
                        value: style,
                        child: Text(style.name),
                      ),
                    )
                    .toList(),
                onChanged: (style) {
                  if (style != null) {
                    setState(() => _selectedStyle = style);
                  }
                },
              ),
              const SizedBox(height: 32),
              timer.SimpleCountDownTimer(
                // key forces a rebuild so the new animation restarts
                key: ValueKey(_selectedStyle),
                duration: const Duration(days: 1, seconds: 5),
                animationStyle: _selectedStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
