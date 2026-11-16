import 'package:flutter/material.dart';

import '../widgets/holographic_background.dart';
import '../widgets/holographic_button.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _textController;
  String _selectedEmotion = 'เหนื่อยล้า 72%';
  String _selectedStyle =
      'Fluid'; // ตัวแปรเก็บสไตล์ที่เลือก (Fluid, Glitch, Minimal, Layered)

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'ฉันโอเค แค่วันนี้เหนื่อยมามากหน่อย',
    );
    // ดักฟังการพิมพ์ เพื่ออัปเดตตัวเลขจำนวนตัวอักษรแบบเรียลไทม์
    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HolographicBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Top Header ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'EMOTYPE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Text(
                      'CREATE   GALLERY   ABOUT',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 255, 255, 255),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                // --- Title ---
                const Text(
                  'EMOTYPE',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Emotion × Typography\nเมื่อความรู้สึกกลายเป็นรูปแบบตัวอักษร',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(
                      255,
                      255,
                      255,
                      255,
                    ).withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 24),

                // --- 01 Write Your Feeling ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '01  WRITE YOUR FEELING',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '${_textController.text.length} / 200',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white24),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _textController,
                    maxLines: 3,
                    maxLength: 200,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      counterText: '',
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // --- 02 Emotion Tone ---
                const Text(
                  '02  EMOTION TONE (AI DETECT)',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildEmotionChip('เหนื่อยล้า 72%', true),
                    const SizedBox(width: 8),
                    _buildEmotionChip('สงบ 18%', false),
                    const SizedBox(width: 8),
                    _buildEmotionChip('หวังเล็กๆ 10%', false),
                  ],
                ),
                const SizedBox(height: 20),

                // --- 03 Style (เพิ่มส่วนเลือกสไตล์ตาม Reference) ---
                const Text(
                  '03  STYLE',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 85,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildStyleCard('Fluid', const Color(0xFFF472B6)),
                      const SizedBox(width: 12),
                      _buildStyleCard('Glitch', const Color(0xFF38BDF8)),
                      const SizedBox(width: 12),
                      _buildStyleCard('Minimal', const Color(0xFFA78BFA)),
                      const SizedBox(width: 12),
                      _buildStyleCard('Layered', const Color(0xFF34D399)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // --- Generate Button ---
                HolographicButton(
                  text: 'GENERATE EMOTYPE',
                  onPressed: () {
                    // พาไปยังหน้า ResultScreen พร้อมส่งข้อความและสไตล์ที่เลือกไปด้วย
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          inputText: _textController.text,
                          selectedStyle: _selectedStyle,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget สำหรับสร้าง Chip อารมณ์
  Widget _buildEmotionChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFF38BDF8).withOpacity(0.3)
            : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF38BDF8) : Colors.white24,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Widget สำหรับแสดงการ์ดเลือก Style (Fluid, Glitch, Minimal, Layered)
  Widget _buildStyleCard(String styleName, Color accentColor) {
    bool isSelected = _selectedStyle == styleName;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedStyle = styleName;
        });
      },
      child: Container(
        width: 75,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? accentColor : Colors.white.withOpacity(0.2),
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: accentColor.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: accentColor.withOpacity(0.6)),
              ),
              child: Icon(Icons.auto_awesome, color: accentColor, size: 18),
            ),
            const SizedBox(height: 6),
            Text(
              styleName,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
