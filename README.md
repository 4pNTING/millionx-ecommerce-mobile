# MillionX Store — Flutter Customer Frontend

โปรเจกต์ใหม่ที่คัดลอกจากโครงสร้าง `flutter_pos` สำหรับลูกค้า ecommerce
เชื่อม `millionx-ecommerce-backend` ไม่ใช่ `backend-default` และไม่ใช่แอปพนักงาน

## ที่ทำแล้ว

- Catalog สาธารณะ: Categories ทุกระดับใน request เดียว
- Product list: Search, Category filter, Pagination
- Product detail: Variant, Attributes, ราคา LAK และแกลเลอรีรูปจาก backend
- Customer Register / Login / Restore session / Logout
- หน้าอ่าน Customer Profile จาก `myCustomerProfile`
- UI responsive สีขาว พร้อม English / Lao
- Feature-first architecture: presentation / domain / data, Riverpod, GoRouter, Dio

ไม่มี seed, demo account หรือ fake product ในแอปจริง; fixtures อยู่เฉพาะใน test
บัญชี `admin/admin123` ใช้สำหรับพนักงาน ไม่ใช่ Customer Login ของโปรเจกต์นี้

## Run

```bash
cd /Users/ting/Documents/millionx-ecommerce-frontend
flutter pub get
flutter run -d chrome --web-port=9070 --dart-define=API_BASE_URL=http://localhost:3001/api-gateway
```

เปิด MillionX backend ที่พอร์ต 3001 ก่อน หาก backend ใช้พอร์ตอื่นให้เปลี่ยน `API_BASE_URL`
อย่าชี้ไปยัง POS/backend-default ซึ่งใช้ GraphQL คนละสัญญา
VS Code: เปิดโฟลเดอร์นี้แล้วเลือก `MillionX Store · Chrome` ใน Run and Debug

Android emulator ใช้ IP `10.0.2.2` แทน localhost:

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:3001/api-gateway
```

มือถือจริงให้ใช้ LAN IP ของเครื่อง backend; production ใช้ HTTPS
Flutter รับ config นี้ผ่าน `--dart-define` ไม่ได้อ่าน Next.js `.env` อัตโนมัติ
รูปแบบ URL `/uploads/...` จะ resolve ไปยัง origin ของ backend

## Verify / Production web build

```bash
flutter analyze --no-pub
dart run tool/auth_contract_smoke.dart
dart run tool/catalog_contract_smoke.dart
flutter test --no-pub --platform chrome
flutter build web --release --no-pub --dart-define=API_BASE_URL=https://YOUR-MILLIONX-HOST/api-gateway
```

ผล build อยู่ใน `build/web`; web server สำหรับ deploy ต้องตั้ง SPA fallback
Backend ต้องอนุญาต CORS ให้ origin ของ frontend รวมถึงพอร์ต 9070 ใน local

ดู [Architecture และผลตรวจต้นแบบ](docs/ARCHITECTURE.md)
และ [สถานะ/ข้อจำกัดการตรวจ](docs/VERIFICATION.md)

งานถัดไป: Profile edit, Address UI, Refresh ระหว่างใช้งาน และ live integration test
Cart / Checkout / Order / Payment ยังไม่อยู่ใน clone ชุดนี้
