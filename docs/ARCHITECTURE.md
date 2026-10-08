# MillionX Flutter Frontend — Architecture

ตรวจต้นแบบ `/Users/ting/Documents/GitHub/flutter_pos` และ backend
`/Users/ting/Documents/Backend_Architecture/millionx-ecommerce-backend` เมื่อ 8 ตุลาคม 2026

## ที่มาของโปรเจกต์

คัดลอก Android / iOS / Web skeleton, dependency และแนวทางแบ่ง feature จาก `flutter_pos`
โดยไม่คัดลอก `.git`, build cache, zip backup หรือข้อมูลเครื่องเดิม
Auth ลูกค้าใช้พื้นฐานจาก `millionx-ecommerce-flutter` แล้วเพิ่ม Register และ public storefront
โปรเจกต์ต้นฉบับ, Next.js Admin / Storefront และ `millionx-admin-flutter` ไม่ได้ถูกแก้ไข

ต้นแบบไม่มี remote Git ให้ clone จึงเป็นสำเนา local สำหรับเริ่มโปรเจกต์ใหม่ ไม่ใช่ fork ที่ติดตาม remote เดิม

## ผลตรวจต้นแบบ

| ส่วน | ผลตรวจ | การปรับในโปรเจกต์ใหม่ |
| --- | --- | --- |
| Feature-first | เหมาะสำหรับขยาย ecommerce | แยก auth / category / product / customer / home |
| presentation / domain / data | แยกหน้าที่ชัด | UI ไม่เรียก Dio หรือเขียน GraphQL เอง |
| Riverpod | จัดการ dependency และ async state | Provider อยู่ใน presentation, domain ไม่ขึ้นกับ Flutter |
| GoRouter | ใช้ได้ทั้ง Web และ Mobile | Catalog เปิดสาธารณะ; `/account` ต้อง Login ลูกค้า |
| Auth POS | เป็นพนักงานและใช้สัญญาคนละ backend | ใช้ `loginCustomer` แทน `login(loginData: ...)` |
| Category POS | CRUD และ field คนละชุดกับ MillionX | ใช้ `categories(filter: CategoryFilterInput)` |
| Dashboard POS | ไม่ใช่หน้าร้านลูกค้า | เปลี่ยนเป็น browse/search/detail |
| Native identity | ยังเป็นชื่อ POS | เปลี่ยนชื่อแอปเป็น MillionX Store และแยก bundle ID |

## โครงสร้าง

```text
lib/
├── app/                     # Theme, application, routing
├── core/
│   ├── config/              # API_BASE_URL และ image URL
│   ├── domain/              # PageResult
│   ├── localization/        # English / Lao
│   ├── network/             # GraphQL gateway, Dio, error types
│   └── widgets/             # StoreScaffold, StoreImage, RetryPanel
└── features/
    ├── auth/                # Login, Register, restore, logout
    ├── category/            # Categories ทุกระดับ
    ├── product/             # Product list/detail, Variant, ราคา, รูป
    ├── customer/            # Profile ของลูกค้าที่ Login
    └── home/presentation/   # รวม catalog เป็นหน้าร้าน
```

แต่ละ feature ที่มีข้อมูลใช้:

```text
presentation → domain/usecases → repository interface
                                  ↑ implementation ใน data
                                  └→ remote datasource → GraphQL gateway → MillionX backend
```

- domain เก็บ entity, repository contract และ use case; ไม่มี widget / Dio / Riverpod
- data เก็บ DTO mapping, GraphQL และ repository implementation
- presentation เก็บ screen, controller และ providers
- Core ใช้ร่วมกันเฉพาะเรื่องพื้นฐาน ไม่รวม business logic ของทุก feature เป็น repository เดียว
- `home` เป็นตัวประกอบ UI โดย reuse category และ product providers

## การเชื่อม Backend

| หน้า/การทำงาน | MillionX GraphQL |
| --- | --- |
| หมวดหมู่ | `categories(filter: {fetchAll: true, rootOnly: false, includeInactive: false})` |
| รายการสินค้า | `products(filter: {keyword, categoryId?, currency: "LAK", page, limit: 12, includeInactive: false})` |
| รายละเอียด | `product(id: ..., currency: "LAK")` |
| สมัคร | `registerCustomer(input: RegisterCustomerInput!)` |
| Login ลูกค้า | `loginCustomer(input: {identifier, password})` |
| Restore session | `refreshCustomerToken(input: {refreshToken})` |
| บัญชีลูกค้า | `myCustomerProfile` พร้อม Bearer access token |

Category ใช้ request เดียวโหลดทั้ง root และ child; `parentId` ยังเป็นความสัมพันธ์ใน table เดิม
รายการสินค้ามี pagination ฝั่ง backend ไม่ได้โหลดทุกสินค้าแล้วแบ่งหน้าบน UI
Variant attributes อ่าน `attributesJson`; URL รูปและ alt text มาจาก backend ไม่มีสินค้า mock ใน runtime
รูปหน้ารายละเอียดเลือกได้ทั้งรูปทั่วไปและรูปที่ตรงกับ Variant ที่เลือก

## Auth และความปลอดภัย

- บัญชีลูกค้าแยกจาก Admin (`ecommerce.users`); `admin/admin123` ไม่ใช่ Login ของแอปนี้
- ไม่ฝังรหัสผ่านหรือ token ใน source; สมัครบัญชีผ่าน backend หรือใช้บัญชีลูกค้าที่มีอยู่จริง
- เก็บ session ผ่าน `flutter_secure_storage`; restore ด้วย Refresh API เมื่อเปิดแอป
- Backend ล่มขณะ restore: เก็บ session ไว้ให้ retry; token ถูกปฏิเสธ: ล้าง session
- Logout ล้าง session ในเครื่อง ยังไม่ได้เพิ่ม server-side revoke
- Refresh ระหว่างใช้งานเมื่อ access token หมดอายุยังเป็นงานต่อไป ไม่ใช่ silent refresh ทุก request
- Web storage มีข้อจำกัดของ browser/XSS; production ควรทบทวน session strategy และ CSP
- API และ image URL เป็นข้อมูลสาธารณะ; production ต้องใช้ HTTPS
- Android เปิด HTTP เฉพาะ debug/profile สำหรับ localhost ไม่ได้เปิด cleartext ใน release
- Bundle IDs `com.example...` เป็น placeholder แยกจาก POS ต้องเปลี่ยนเป็นโดเมนบริษัทก่อน publish

## ขอบเขตที่ยังไม่ทำ

Customer profile edit, address management, reset password, cart, checkout, orders, payment,
inventory และการทดสอบ end-to-end กับฐานข้อมูลจริง ยังไม่ได้เพิ่มในงาน clone ครั้งนี้
ไม่ควรสรุปว่า Phase 1 ทุก frontend feature หรือระบบพร้อม production แล้ว
