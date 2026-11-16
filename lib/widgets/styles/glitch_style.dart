import 'package:flutter/material.dart';

class GlitchStyle extends StatelessWidget {
  final String text;

  const GlitchStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: const Offset(-3, 2),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF38BDF8).withOpacity(0.8),
              height: 1.4,
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(3, -2),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: const Color(0xFFF472B6).withOpacity(0.8),
              height: 1.4,
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}