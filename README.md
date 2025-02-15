# InMailFix

โปรเจ็คนี้เป็นโปรเจ็คที่พัฒนาขึ้นเพื่อใช้ในวิทยาลัย โดยใช้ Flutter ในการพัฒนาแอปพลิเคชัน

**[Preview App Here](https://appetize.io/app/b_3fxr4dqvg6furmgzm4ulbzj6te)**

![](https://img2.pic.in.th/pic/1bac7bc44ad683808.png)![](https://img5.pic.in.th/file/secure-sv1/2a69f7a9552c9fad6.png)![](https://img5.pic.in.th/file/secure-sv1/3fb8ece35173a56d3.png)

## ฟีเจอร์ของโปรเจ็ค

- ระบบล็อกอิน: ผู้ใช้สามารถเข้าสู่ระบบด้วยรหัสประจำตัวและรหัสผ่าน
- หน้าข้อมูล: แสดงข้อมูลนักศึกษา เช่น รหัสนักศึกษา ชื่อ และสาขา
- การแจ้งปัญหา: ผู้ใช้สามารถแจ้งขอเปลี่ยนรหัสผ่าน Gmail หรือแจ้งปัญหาในการเข้าใช้งาน Gmail

## ปลั๊กอิน

**ฟังก์ชันหลัก**
- firebase_core: สำหรับการจัดการการเริ่มต้นใช้งาน Firebase
- firebase_auth: ใช้สำหรับการยืนยันตัวตนของผู้ใช้ผ่าน Firebase
- cloud_firestore: ช่วยให้สามารถเชื่อมต่อและจัดการฐานข้อมูล Firestore

**การปรับปรุง UI**
- google_fonts: รองรับฟอนต์จาก Google Fonts และฟอนต์อื่น ๆ
- gradient_widgets: เพิ่มวิดเจ็ตที่มีการออกแบบด้วยกราเดียนท์เพื่อสร้างความสวยงาม
- Flutter_ScreenUtil: ได้แก้ไขขนาด Layout และ Font ทั้งหมด
- flutter_spinkit: icon การโหลดที่เคลื่อนไหวเพื่อใช้สำหรับหน้า Loading

**เครื่องมือเสริม**
- shared_preferences: ใช้สำหรับการเก็บข้อมูลในเครื่อง เช่น ฟีเจอร์ "จดจำการลงชื่อใช้งาน"
- url_launcher: สำหรับเปิด URL หรือนำทางไปยังแอปพลิเคชันอื่น ๆ
- fluttertoast: แสดงข้อความแจ้งเตือน (Toast) เพื่อแจ้งข้อมูลแก่ผู้ใช้
- Shorebird: เพิ่มการอัปเดตอัตโนมัติ โดยใช้คำสั่ง `shorebird patch --platforms=android`
- connectivity_plus: ใช้เอาไว้ตรวจสอบว่าสามารถเข้าถึงอินเตอร์ก่อนเข้าแอปได้ไหม

**การตรวจสอบและการจัดการสถานะ**
- form_field_validator: ช่วยให้การตรวจสอบความถูกต้องของฟอร์มเป็นเรื่องง่าย
- provider: ใช้สำหรับจัดการสถานะของแอปพลิเคชันอย่างมีประสิทธิภาพ

## การเริ่มต้นใช้งาน

1. คลอนโปรเจ็คนี้ไปยังเครื่องของคุณ
2. ติดตั้ง dependencies โดยใช้คำสั่ง `flutter pub get`
3. รันแอปพลิเคชันโดยใช้คำสั่ง `flutter run`

## โครงสร้างของโปรเจ็ค

- `main.dart`: ไฟล์หลักของแอปพลิเคชันที่ใช้ในการเริ่มต้นแอป
- `lib/src/login.dart`: ไฟล์ที่ใช้ในการจัดการหน้าล็อกอิน
- `lib/src/information.dart`: ไฟล์ที่ใช้ในการจัดการหน้าข้อมูลนักศึกษา

## การพัฒนาเพิ่มเติม

หากต้องการพัฒนาเพิ่มเติม สามารถแก้ไขไฟล์ในโฟลเดอร์ `lib/src` และรันคำสั่ง `flutter run` เพื่อดูผลลัพธ์
