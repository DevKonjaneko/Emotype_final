import 'package:flutter/material.dart';

class HolographicButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const HolographicButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        // ไล่เฉดสีชมพู-ฟ้าโปร่งแสงสไตล์กระจกโฮโลแกรม
        gradient: LinearGradient(
          colors: [
            const Color(0xFFF472B6).withOpacity(0.35),
            const Color(0xFF38BDF8).withOpacity(0.35),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        // ขอบกระจกเรืองแสงบางๆ
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
          width: 1.5,
        ),
        // เงาเรืองแสงรอบปุ่ม (Glow Effect)
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF472B6).withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.auto_awesome, color: Colors.white, size: 18),
                SizedBox(width: 8),
                Text(
                  'GENERATE EMOTYPE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}