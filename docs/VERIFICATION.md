# ผลตรวจ MillionX Flutter Frontend

วันที่ตรวจ: 8 ตุลาคม 2026

## ขอบเขต

สร้างโปรเจกต์ลูกค้าใหม่จาก local template ไม่ได้แก้ backend, ฐานข้อมูล,
Next.js frontend เดิม หรือ `millionx-admin-flutter`
ยังไม่ได้ตั้ง remote Git / commit / push โปรเจกต์นี้

## ผลตรวจ

| การตรวจ | ผล |
| --- | --- |
| Dependency | `flutter pub get --offline` ผ่าน ใช้เวอร์ชันจาก cache และ lockfile |
| Static analysis | `flutter analyze --no-pub` ผ่าน ไม่มี issue |
| Auth contract smoke | ผ่าน Login / Restore refresh / Logout / Register กับ test gateway |
| Catalog/customer contract smoke | ผ่าน 12 เงื่อนไขด้วย test fixtures |
| GraphQL document validation | Category, Product list/detail, Profile, Register, Login รวม 6 operations ตรงกับ schema ที่บันทึกไว้; Refresh API มีใน source แต่ยังไม่มีใน schema ที่บันทึกไว้ |
| Production Web build | `flutter build web --release --no-pub` ผ่าน; output `build/web` |
| Native Flutter tests | รันไม่ได้: engine `darwin-x64` crash SIGABRT ใน `cpuinfo_macos.cc` บนเครื่อง ARM |
| Chrome Flutter tests | Compile แล้ว แต่ runner เปิด Chrome ไม่สำเร็จหลัง 3 ครั้ง; ยังไม่ถือว่าทดสอบผ่าน |
| Backend `localhost:3001` | Connection refused ขณะตรวจ |
| Service `localhost:3000` | ตอบ GraphQL แต่ไม่มี Query `categories` / `products`; ไม่ใช่สัญญาที่ frontend ใหม่นี้ต้องใช้ |
| Android / iOS build | ยังไม่ได้ build หรือทดสอบบนอุปกรณ์ |

Fixtures ใน `test/` และ `tool/` มีไว้ตรวจ mapping และ flow เท่านั้น
ไม่ใช่ seed ฐานข้อมูลหรือข้อมูลที่แอปแสดงจริง
การ build ผ่านไม่ยืนยันว่า Login กับฐานข้อมูลจริงผ่าน

## ไฟล์ทดสอบ

- `test/features/auth/`: สัญญา Customer Login / Register / Refresh, persist session,
  network outage เก็บ session, invalid refresh ล้าง session และ Logout
- `test/features/catalog/catalog_test.dart`: category hierarchy, filter/pagination,
  attributes / ราคา / alt text และ Bearer profile
- `test/storefront_widget_test.dart`: public browsing/detail และ account route guard
- `tool/auth_contract_smoke.dart`: ตรวจ Auth โดยไม่ต้องใช้ Flutter engine
- `tool/catalog_contract_smoke.dart`: ตรวจ 12 เงื่อนไขของ catalog/customer contract โดยไม่ใช้ engine

## ก่อนยืนยันว่าหน้าร้านพร้อมใช้งานจริง

1. เปิด MillionX backend ที่พอร์ต 3001 และยืนยัน schema ล่าสุด
   (source มี `refreshCustomerToken` แต่ `src/schema.gql` ที่บันทึกไว้ยังไม่มี mutation นี้)
2. ให้ backend อนุญาต CORS จาก `http://localhost:9070`
3. เปิดหน้า Catalog แล้วตรวจ product/category จริง รวมถึง pagination/search
4. สมัครบัญชี Customer ของตัวเอง แล้ว Login ด้วย email/phone และ password นั้น
5. ตรวจ Profile, reload เพื่อ restore session และ Logout
6. ตรวจรูป main/variant จาก URL จริง; หาก URL เป็น localhost ของอีกเครื่องต้องเปลี่ยนให้ client เข้าถึงได้
7. รัน automated Flutter tests อีกครั้งเมื่อ Flutter engine / Chrome runner ใช้งานได้
8. ก่อน deploy เปลี่ยน API เป็น HTTPS, bundle IDs, app icons และทบทวน Web token/session security
   Android release signing ยังเป็น debug key จากต้นแบบ ต้องตั้ง release keystore ก่อนเผยแพร่

## งานที่ยังไม่ได้เพิ่ม

- Profile edit และ Address CRUD UI
- Silent refresh ระหว่างใช้งาน, server-side logout/revoke
- Reset Password / verification UI
- Cart / Checkout / Order / Payment / Inventory
- Live end-to-end tests และทดสอบจริงบน Android / iOS

นี่คือ frontend foundation ที่เชื่อมสัญญา Phase 1 ไม่ใช่การประกาศว่า Phase 1 ทุกส่วนเสร็จหรือ Phase 2 เสร็จแล้ว
