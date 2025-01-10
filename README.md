# InMailFix

This project is developed for college use, utilizing Flutter to create the application.

## Project Features

- Login System: Users can log in with their ID and password.
- Information Page: Displays student information such as student ID, name, and major.
- Issue Reporting: Users can request to change their Gmail password or report issues accessing Gmail.

## Plugins

This version of the app uses several plugins to enhance functionality and performance. Below is a list of the key plugins
## Core Functionality
- firebase_core: Manages Firebase initialization for the app.
- firebase_auth: Handles user authentication via Firebase.
- cloud_firestore: Enables seamless Firestore database interaction.
## UI Enhancements
- google_fonts: Provides custom fonts, including Google Fonts.
- gradient_widgets: Adds widgets with gradient styling for a more dynamic UI.
## Utilities
- shared_preferences: Enables local data storage for features like "Remember Me."
- url_launcher: Facilitates launching URLs or external applications.
- fluttertoast: Displays toast messages to provide user feedback.
## Validation & State Management
- form_field_validator: Simplifies form field validation.
- provider: Manages state efficiently across the app.

## Getting Started

1. Clone this project to your local machine.
2. Install dependencies using the command `flutter pub get`.
3. Run the application using the command `flutter run`.

## Project Structure

- `main.dart`: The main file of the application used to start the app.
- `lib/src/login.dart`: Manages the login page.
- `lib/src/information.dart`: Manages the student information page.

## Further Development

For further development, you can modify files in the `lib/src` folder and run the command `flutter run` to see the results.

===========================================================================

# InMailFix

โปรเจ็คนี้เป็นโปรเจ็คที่พัฒนาขึ้นเพื่อใช้ในวิทยาลัย โดยใช้ Flutter ในการพัฒนาแอปพลิเคชัน

## ฟีเจอร์ของโปรเจ็ค

- ระบบล็อกอิน: ผู้ใช้สามารถเข้าสู่ระบบด้วยรหัสประจำตัวและรหัสผ่าน
- หน้าข้อมูล: แสดงข้อมูลนักศึกษา เช่น รหัสนักศึกษา ชื่อ และสาขา
- การแจ้งปัญหา: ผู้ใช้สามารถแจ้งขอเปลี่ยนรหัสผ่าน Gmail หรือแจ้งปัญหาในการเข้าใช้งาน Gmail

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
