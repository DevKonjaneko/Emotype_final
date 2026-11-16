import 'package:flutter/material.dart';

class MinimalStyle extends StatelessWidget {
  final String text;

  const MinimalStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w300,
        color: Colors.white.withOpacity(0.95),
        letterSpacing: 2.5,
        height: 1.6,
      ),
    );
  }
}