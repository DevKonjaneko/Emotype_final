import 'package:flutter/material.dart';

class FluidStyle extends StatelessWidget {
  final String text;

  const FluidStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.water_drop_outlined, color: Color(0xFFF472B6), size: 28),
        const SizedBox(height: 12),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.4,
            letterSpacing: 0.5,
            shadows: [
              Shadow(color: Color(0xFFF472B6), blurRadius: 25, offset: Offset(0, 0)),
              Shadow(color: Colors.black54, blurRadius: 10, offset: Offset(0, 4)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFF472B6).withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFF472B6).withOpacity(0.4)),
          ),
          child: const Text(
            'FLOWING & EMOTIONAL',
            style: TextStyle(
              fontSize: 9,
              color: Color(0xFFF472B6),
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ],
    );
  }
}