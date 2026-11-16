import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../widgets/holographic_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () 
    {
      if (!mounted) return;
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const HomeScreen() )
      );
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. ครอบด้วย HolographicBackground ตรง body ที่นี่
      body: HolographicBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'EMOTYPE',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.5,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Emotion × Typography',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 255, 255),
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 96,
                height: 96,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          ),
        ),
      ), // 2. ปิดวงเล็บของ HolographicBackground ตรงนี้
    );
  }
}