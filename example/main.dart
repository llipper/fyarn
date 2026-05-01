import 'package:flutter/material.dart';
// Note: In a real project, these would be generated files in your project.
// This example shows the structure required to initialize Fyarn.

void main() {
  runApp(const FyarnExampleApp());
}

class FyarnExampleApp extends StatelessWidget {
  const FyarnExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fyarn UI Example',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🧶 Fyarn Design System',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Run "fyarn init" and "fyarn add button" to start!',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
