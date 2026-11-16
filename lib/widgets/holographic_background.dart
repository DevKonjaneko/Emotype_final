import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HolographicBackground extends StatefulWidget {
  final Widget child;

  const HolographicBackground({super.key, required this.child});

  @override
  State<HolographicBackground> createState() => _HolographicBackgroundState();
}

class _HolographicBackgroundState extends State<HolographicBackground> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // โหลดไฟล์วิดีโอ
    _controller = VideoPlayerController.asset('assets/videos/video.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true); // เล่นวนลูป
        _controller.setVolume(0.0);   // ปิดเสียง
        
        // 🎛️ ปรับความเร็ววิดีโอตรงนี้ครับ!
        // 1.0 = ความเร็วปกติ, 0.7 = ช้าลงนิดหน่อยกำลังสวย, 0.5 = ช้าลงครึ่งหนึ่ง
        _controller.setPlaybackSpeed(0.6); 

        _controller.play();           // เริ่มเล่นวิดีโอ
        
        if (mounted) {
          setState(() {
            _isInitialized = true;
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. แสดงวิดีโอพื้นหลังแบบเต็มจอ
        if (_isInitialized)
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
        else
          Container(color: const Color(0xFF0B0814)),

        // 2. ฟิล์มดำโปร่งแสงทับเพื่อให้ตัวหนังสือ UI อ่านง่ายขึ้น
        Container(
          color: Colors.black.withOpacity(0.35),
        ),

        // 3. เนื้อหาหลักของหน้าจอ
        widget.child,
      ],
    );
  }
}