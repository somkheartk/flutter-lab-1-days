# เริ่มต้นใช้งาน Backend อย่างรวดเร็ว (Quick Start)

## 🎯 เป้าหมาย

เริ่มต้น Backend API ใน 5 นาที!

---

## ✅ ขั้นตอนที่ 1: ติดตั้ง Prerequisites

### ต้องมีติดตั้งก่อน:

1. **Node.js** (version 18 หรือสูงกว่า)
   ```bash
   node --version  # ตรวจสอบ version
   ```
   ถ้ายังไม่มี: ดาวน์โหลดจาก https://nodejs.org

2. **MongoDB**
   
   **ตัวเลือกที่ 1: ติดตั้ง Local (แนะนำสำหรับเริ่มต้น)**
   - Windows: ดาวน์โหลด MongoDB Community Server จาก https://www.mongodb.com/try/download/community
   - Mac: `brew install mongodb-community`
   - Linux: `sudo apt-get install mongodb`
   
   **ตัวเลือกที่ 2: ใช้ Cloud (ง่ายกว่า ไม่ต้องติดตั้ง)**
   - สมัคร MongoDB Atlas (ฟรี): https://www.mongodb.com/cloud/atlas
   - สร้าง Cluster ใหม่
   - คัดลอก Connection String

---

## ✅ ขั้นตอนที่ 2: ติดตั้ง Dependencies

```bash
# ไปที่ folder backend
cd backend

# ติดตั้ง packages
npm install
```

รอสักครู่... เสร็จแล้ว! 🎉

---

## ✅ ขั้นตอนที่ 3: ตั้งค่า Environment

```bash
# คัดลอกไฟล์ตัวอย่าง
cp .env.example .env
```

**แก้ไขไฟล์ `.env`:**

### สำหรับ MongoDB Local:
```env
MONGODB_URI=mongodb://localhost:27017/flutter-lab-db
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
JWT_EXPIRATION=24h
PORT=3000
NODE_ENV=development
```

### สำหรับ MongoDB Atlas (Cloud):
```env
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/flutter-lab-db?retryWrites=true&w=majority
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
JWT_EXPIRATION=24h
PORT=3000
NODE_ENV=development
```

**⚠️ สำคัญ:** เปลี่ยน `JWT_SECRET` เป็นรหัสของคุณเอง!

---

## ✅ ขั้นตอนที่ 4: เริ่ม MongoDB (ถ้าใช้ Local)

```bash
# Windows
net start MongoDB

# Mac/Linux
brew services start mongodb-community
# หรือ
sudo systemctl start mongod
```

**หมายเหตุ:** ถ้าใช้ MongoDB Atlas ข้ามขั้นตอนนี้ได้เลย

---

## ✅ ขั้นตอนที่ 5: เติมข้อมูลเริ่มต้นลง Database

```bash
npm run seed
```

คุณจะเห็น:
```
✅ Connected to MongoDB
🗑️  Cleared existing data
✅ Inserted 12 products
✅ Inserted 2 users

🎉 Database seeded successfully!

📝 Demo credentials:
   Email: demo@test.com
   Password: password

   Email: admin@test.com
   Password: admin123
```

---

## ✅ ขั้นตอนที่ 6: เริ่มต้น Server

```bash
npm run start:dev
```

คุณจะเห็น:
```
🚀 Backend server running on http://localhost:3000
📚 API available at http://localhost:3000/api
```

**เสร็จแล้ว! 🎉**

---

## 🧪 ทดสอบว่าทำงานหรือไม่

### ทดสอบด้วย Browser:

เปิด Browser ไปที่: http://localhost:3000/api

คุณจะเห็น:
```json
{
  "name": "Flutter Lab Backend API",
  "version": "1.0.0",
  "status": "running",
  "endpoints": {
    "auth": "/api/auth",
    "products": "/api/products",
    "health": "/api/health"
  }
}
```

### ทดสอบ Products API:

เปิด: http://localhost:3000/api/products

คุณจะเห็นรายการสินค้าทั้งหมด!

---

## 📝 ทดสอบ Authentication

### 1. ติดตั้ง Postman (แนะนำ)

ดาวน์โหลด: https://www.postman.com/downloads/

### 2. ทดสอบ Login:

**URL:** `POST http://localhost:3000/api/auth/login`

**Body (JSON):**
```json
{
  "email": "demo@test.com",
  "password": "password"
}
```

**Response:**
```json
{
  "user": {
    "id": "...",
    "email": "demo@test.com",
    "name": "Demo User"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

คัดลอก `token` เก็บไว้!

### 3. ทดสอบ Protected Route:

**URL:** `POST http://localhost:3000/api/products`

**Headers:**
```
Authorization: Bearer YOUR_TOKEN_HERE
```

**Body (JSON):**
```json
{
  "title": "สินค้าทดสอบ",
  "price": 999,
  "description": "นี่คือสินค้าทดสอบ",
  "category": "electronics",
  "image": "https://via.placeholder.com/400"
}
```

---

## 🎯 API Endpoints ทั้งหมด

### Public (ไม่ต้อง Login)

| Method | URL | คำอธิบาย |
|--------|-----|----------|
| GET | /api | ข้อมูล API |
| GET | /api/health | Health check |
| POST | /api/auth/register | สมัครสมาชิก |
| POST | /api/auth/login | เข้าสู่ระบบ |
| GET | /api/products | ดูสินค้าทั้งหมด |
| GET | /api/products/:id | ดูสินค้าตาม ID |
| GET | /api/products/category/:category | ดูสินค้าตามหมวดหมู่ |
| GET | /api/products/categories | ดูหมวดหมู่ทั้งหมด |

### Protected (ต้อง Login)

| Method | URL | คำอธิบาย |
|--------|-----|----------|
| POST | /api/products | เพิ่มสินค้า |
| PUT | /api/products/:id | แก้ไขสินค้า |
| DELETE | /api/products/:id | ลบสินค้า |

---

## 🔧 Commands ที่ใช้บ่อย

```bash
# เริ่ม server (development mode)
npm run start:dev

# เริ่ม server (production mode)
npm run build
npm run start:prod

# เติมข้อมูลใหม่
npm run seed

# ตรวจสอบ code style
npm run lint

# Format code
npm run format

# รัน tests
npm run test
```

---

## 🐛 แก้ปัญหา

### ปัญหา: MongoDB connection failed

**วิธีแก้:**
1. ตรวจสอบว่า MongoDB เปิดอยู่หรือไม่:
   ```bash
   # Windows
   net start MongoDB
   
   # Mac/Linux
   brew services start mongodb-community
   ```

2. ตรวจสอบ `MONGODB_URI` ใน `.env` ให้ถูกต้อง

### ปัญหา: Port 3000 ถูกใช้งานแล้ว

**วิธีแก้:**
แก้ไข `PORT` ใน `.env`:
```env
PORT=3001
```

### ปัญหา: JWT_SECRET error

**วิธีแก้:**
ตรวจสอบว่ามีไฟล์ `.env` และมี `JWT_SECRET` อยู่

---

## 📖 เรียนรู้เพิ่มเติม

- 📘 **[BACKEND_GUIDE.md](../BACKEND_GUIDE.md)** - คู่มือ Backend ภาษาไทยฉบับเต็ม
- 📗 **[BACKEND_README.md](./BACKEND_README.md)** - เอกสาร API ภาษาอังกฤษ
- 🌐 **[NestJS Docs](https://docs.nestjs.com)** - เอกสารทางการ NestJS
- 🍃 **[MongoDB Docs](https://docs.mongodb.com)** - เอกสารทางการ MongoDB

---

## 🎉 ขั้นตอนถัดไป

เมื่อ Backend ทำงานได้แล้ว:

1. ✅ ทดลองเรียก API endpoints ต่างๆ
2. ✅ ลองสร้าง User ใหม่ผ่าน Register
3. ✅ ทดสอบ Login และใช้ Token
4. ✅ ลองเพิ่ม/แก้ไข/ลบสินค้า
5. ✅ เชื่อมต่อกับ Flutter App
6. ✅ อ่านคู่มือ BACKEND_GUIDE.md เพื่อเรียนรู้เชิงลึก

---

**สนุกกับการเขียน Backend! 🚀**
