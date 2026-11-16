import 'package:flutter/material.dart';

class LayeredStyle extends StatelessWidget {
  final String text;

  const LayeredStyle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // เลเยอร์เงาด้านหลัง (เหลื่อมลงมานิดหน่อย)
        Transform.translate(
          offset: const Offset(0, 6),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF34D399).withOpacity(0.4),
              height: 1.1,
            ),
          ),
        ),
        // เลเยอร์หลักด้านหน้า
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            height: 1.1,
            shadows: [
              Shadow(
                color: Color(0xFF34D399),
                blurRadius: 15,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ],
    );
  }
}