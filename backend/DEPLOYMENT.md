# คู่มือการ Deploy Backend

## 🚀 วิธีการ Deploy Backend ขึ้น Cloud

---

## 1. Deploy บน Railway (แนะนำ - ง่ายที่สุด)

Railway เป็น Platform ที่รองรับ Node.js และ MongoDB ได้เลย ไม่ต้องตั้งค่าอะไรเยอะ

### ขั้นตอน:

1. **สร้าง Account**
   - ไปที่ https://railway.app
   - Sign up ด้วย GitHub

2. **สร้าง Project ใหม่**
   - คลิก "New Project"
   - เลือก "Deploy from GitHub repo"
   - เลือก Repository ของคุณ
   - เลือก folder `backend`

3. **ตั้งค่า Environment Variables**
   - ไปที่ Variables
   - เพิ่ม:
     ```
     MONGODB_URI=mongodb+srv://...
     JWT_SECRET=your-secret-key
     JWT_EXPIRATION=24h
     NODE_ENV=production
     ```

4. **Deploy MongoDB**
   - คลิก "+ New"
   - เลือก "Database" > "MongoDB"
   - คัดลอก Connection String ใส่ใน `MONGODB_URI`

5. **รอ Deploy เสร็จ**
   - Railway จะ build และ deploy อัตโนมัติ
   - จะได้ URL เช่น: `https://your-app.railway.app`

6. **Seed Database**
   ```bash
   # ใน local terminal
   MONGODB_URI=your-railway-mongodb-uri npm run seed
   ```

---

## 2. Deploy บน Render (ฟรี)

### MongoDB (MongoDB Atlas):

1. **สร้าง MongoDB Atlas Account**
   - ไปที่ https://www.mongodb.com/cloud/atlas
   - สมัครฟรี

2. **สร้าง Cluster**
   - เลือก Free tier (M0)
   - เลือก Region ใกล้ที่สุด (Singapore)
   - สร้าง Database User
   - Whitelist IP: เลือก "Allow Access from Anywhere" (0.0.0.0/0)

3. **คัดลอก Connection String**
   ```
   mongodb+srv://username:password@cluster.mongodb.net/flutter-lab-db?retryWrites=true&w=majority
   ```

### Backend (Render):

1. **สร้าง Render Account**
   - ไปที่ https://render.com
   - Sign up ด้วย GitHub

2. **สร้าง Web Service**
   - Dashboard > New > Web Service
   - เชื่อมต่อ GitHub Repository
   - ตั้งค่า:
     - Name: `flutter-lab-backend`
     - Environment: `Node`
     - Build Command: `cd backend && npm install && npm run build`
     - Start Command: `cd backend && npm run start:prod`

3. **ตั้งค่า Environment Variables**
   ```
   MONGODB_URI=mongodb+srv://...
   JWT_SECRET=your-secret-key
   JWT_EXPIRATION=24h
   NODE_ENV=production
   PORT=3000
   ```

4. **Deploy**
   - คลิก "Create Web Service"
   - รอสักครู่จะได้ URL

---

## 3. Deploy บน Heroku

### ขั้นตอน:

1. **ติดตั้ง Heroku CLI**
   ```bash
   npm install -g heroku
   ```

2. **Login**
   ```bash
   heroku login
   ```

3. **สร้าง App**
   ```bash
   cd backend
   heroku create your-app-name
   ```

4. **เพิ่ม MongoDB**
   ```bash
   # ใช้ MongoDB Atlas
   heroku config:set MONGODB_URI="mongodb+srv://..."
   heroku config:set JWT_SECRET="your-secret-key"
   heroku config:set NODE_ENV="production"
   ```

5. **Deploy**
   ```bash
   git add .
   git commit -m "Deploy to Heroku"
   git push heroku main
   ```

6. **เปิด App**
   ```bash
   heroku open
   ```

---

## 4. Deploy บน Vercel (สำหรับ Serverless)

Vercel เหมาะสำหรับ API แบบ Serverless

### ขั้นตอน:

1. **ติดตั้ง Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **สร้างไฟล์ vercel.json**
   ```json
   {
     "version": 2,
     "builds": [
       {
         "src": "backend/src/main.ts",
         "use": "@vercel/node"
       }
     ],
     "routes": [
       {
         "src": "/(.*)",
         "dest": "backend/src/main.ts"
       }
     ]
   }
   ```

3. **Deploy**
   ```bash
   cd backend
   vercel
   ```

4. **ตั้งค่า Environment Variables**
   - ไปที่ Vercel Dashboard
   - Settings > Environment Variables
   - เพิ่ม `MONGODB_URI`, `JWT_SECRET`, etc.

---

## 5. Deploy บน AWS (สำหรับ Production)

### ใช้ AWS Elastic Beanstalk:

1. **ติดตั้ง EB CLI**
   ```bash
   pip install awsebcli
   ```

2. **Initialize**
   ```bash
   cd backend
   eb init -p node.js your-app-name
   ```

3. **Create Environment**
   ```bash
   eb create production-env
   ```

4. **ตั้งค่า Environment Variables**
   ```bash
   eb setenv MONGODB_URI="..." JWT_SECRET="..." NODE_ENV="production"
   ```

5. **Deploy**
   ```bash
   eb deploy
   ```

---

## 6. Docker Deploy

### สร้าง Dockerfile:

```dockerfile
# backend/Dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start:prod"]
```

### docker-compose.yml:

```yaml
version: '3.8'

services:
  backend:
    build: ./backend
    ports:
      - "3000:3000"
    environment:
      - MONGODB_URI=mongodb://mongo:27017/flutter-lab-db
      - JWT_SECRET=your-secret-key
      - NODE_ENV=production
    depends_on:
      - mongo

  mongo:
    image: mongo:latest
    ports:
      - "27017:27017"
    volumes:
      - mongo-data:/data/db

volumes:
  mongo-data:
```

### Deploy:

```bash
docker-compose up -d
```

---

## 📝 Checklist ก่อน Deploy

- [ ] เปลี่ยน `JWT_SECRET` เป็นค่าที่ปลอดภัย
- [ ] ตั้งค่า `MONGODB_URI` ให้ถูกต้อง
- [ ] เปลี่ยน `NODE_ENV=production`
- [ ] ทดสอบ build: `npm run build`
- [ ] ทดสอบรัน production: `npm run start:prod`
- [ ] เพิ่ม rate limiting (ถ้าจำเป็น)
- [ ] เปิด HTTPS
- [ ] Backup database
- [ ] ตั้งค่า monitoring/logging

---

## 🔒 Security Checklist

- [ ] ไม่ commit `.env` เข้า Git
- [ ] ใช้ JWT_SECRET ที่ซับซ้อน
- [ ] ตั้งค่า CORS ให้ถูกต้อง
- [ ] ใช้ HTTPS เท่านั้น
- [ ] Hash passwords ด้วย bcrypt
- [ ] Validate input ทุกครั้ง
- [ ] Rate limiting สำหรับ API
- [ ] Keep dependencies updated

---

## 🧪 ทดสอบหลัง Deploy

### 1. ทดสอบ Health Check:
```bash
curl https://your-app.com/api/health
```

### 2. ทดสอบ Register:
```bash
curl -X POST https://your-app.com/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"password123","name":"Test"}'
```

### 3. ทดสอบ Login:
```bash
curl -X POST https://your-app.com/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"password123"}'
```

### 4. ทดสอบ Products:
```bash
curl https://your-app.com/api/products
```

---

## 🔄 Auto Deploy (CI/CD)

### GitHub Actions:

สร้างไฟล์ `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Production

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Setup Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '18'
    
    - name: Install dependencies
      run: |
        cd backend
        npm install
    
    - name: Build
      run: |
        cd backend
        npm run build
    
    - name: Deploy to Railway
      run: |
        # ใส่คำสั่ง deploy ตาม platform ที่ใช้
```

---

## 📊 Monitoring

### ตรวจสอบ Logs:

**Railway:**
```bash
railway logs
```

**Heroku:**
```bash
heroku logs --tail
```

**Render:**
- ไปที่ Dashboard > Logs

---

## 💡 Tips

1. **ใช้ Environment Variables สำหรับทุกอย่างที่เป็น secret**
2. **Backup database เป็นประจำ**
3. **Monitor errors ด้วย tools เช่น Sentry**
4. **ใช้ CDN สำหรับ static files**
5. **Enable caching ที่เหมาะสม**
6. **ตั้งค่า rate limiting เพื่อป้องกัน DDoS**

---

## 🆘 แก้ปัญหา

### ปัญหา: Build failed

**วิธีแก้:**
- ตรวจสอบ `package.json` มี `"build"` script
- ลองรัน `npm run build` ใน local
- ตรวจสอบ Node.js version

### ปัญหา: Cannot connect to MongoDB

**วิธีแก้:**
- ตรวจสอบ `MONGODB_URI` ถูกต้อง
- Whitelist IP ใน MongoDB Atlas
- ตรวจสอบ username/password

### ปัญหา: API ช้า

**วิธีแก้:**
- เพิ่ม Database indexes
- ใช้ caching (Redis)
- Optimize queries
- เพิ่ม server resources

---

**สำเร็จ! Backend ของคุณ Deploy แล้ว! 🎉**
