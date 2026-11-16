class ApiService {
  // ฟังก์ชันสร้างลิงก์รูปภาพโปสเตอร์จาก Pollinations (ฟรี 100% ไม่ต้องใช้ API Key)
  static String getPosterUrl(String userFeeling, String style) {
    final textToUse = userFeeling.isNotEmpty ? userFeeling : 'ฉันโอเค แค่วันนี้เหนื่อยมามากหน่อย';
    
    // แปลงข้อความและสไตล์ให้เป็น Prompt สำหรับ AI สร้างภาพโปสเตอร์
    final prompt = 'A professional high-end 90s VHS retro typography poster, $style style, dark textured aesthetic background, dramatic neon lighting, sharp typography featuring text: "$textToUse", 8k resolution, masterpiece graphic design';
    
    return 'https://image.pollinations.ai/prompt/${Uri.encodeComponent(prompt)}?width=800&height=1200&nologo=true';
  }
}