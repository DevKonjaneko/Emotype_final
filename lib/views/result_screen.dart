import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/holographic_background.dart';

class ResultScreen extends StatelessWidget {
  final String inputText;
  final String selectedStyle;

  const ResultScreen({
    super.key,
    required this.inputText,
    required this.selectedStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textToUse = inputText.isNotEmpty
        ? inputText
        : 'ฉันโอเค แค่วันนี้เหนื่อยมามากหน่อย';

    // ดึง URL รูปภาพโปสเตอร์จาก ApiService
    final imageUrl = ApiService.getPosterUrl(textToUse, selectedStyle);

    return Scaffold(
      body: HolographicBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Column(
              children: [
                // --- Top Bar ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'EMOTYPE / ${selectedStyle.toUpperCase()}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 12),

                // --- Poster Display Card ---
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A0A0C),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _getStyleColor(selectedStyle).withOpacity(0.8),
                        width: 2.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _getStyleColor(selectedStyle).withOpacity(0.35),
                          blurRadius: 40,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      color: _getStyleColor(selectedStyle),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'กำลังสร้างโปสเตอร์สไตล์ ${selectedStyle.toUpperCase()}...',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Text(
                                  'ไม่สามารถโหลดรูปภาพได้ กรุณาลองใหม่อีกครั้ง',
                                  style: TextStyle(color: Colors.white54),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            top: 12,
                            left: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: _getStyleColor(selectedStyle),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'POSTER // ${selectedStyle.toUpperCase()}',
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // --- Bottom Actions ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      icon: Icons.download_rounded,
                      label: 'SAVE',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('📥 บันทึกโปสเตอร์ลงเครื่องสำเร็จ!')),
                        );
                      },
                    ),
                    _buildActionButton(
                      icon: Icons.share_rounded,
                      label: 'SHARE',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('🔗 คัดลอกลิงก์แชร์สำเร็จ!')),
                        );
                      },
                    ),
                    _buildActionButton(
                      icon: Icons.refresh_rounded,
                      label: 'REGENERATE',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getStyleColor(String style) {
    switch (style) {
      case 'Fluid': return const Color(0xFFF472B6);
      case 'Glitch': return const Color(0xFF00FFFF);
      case 'Minimal': return const Color(0xFFA78BFA);
      case 'Layered': return const Color(0xFF34D399);
      default: return Colors.white;
    }
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 16),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}