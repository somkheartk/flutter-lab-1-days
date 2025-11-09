# Flutter Lab Backend API

## 🚀 NestJS + MongoDB Backend

Complete REST API backend for Flutter Lab learning project with Thai documentation.

---

## 📚 Quick Links

- **[QUICKSTART_BACKEND.md](./QUICKSTART_BACKEND.md)** - เริ่มต้นใช้งานใน 5 นาที
- **[API_TESTING.md](./API_TESTING.md)** - ตัวอย่างการทดสอบ API ทั้งหมด
- **[DEPLOYMENT.md](./DEPLOYMENT.md)** - วิธี Deploy ขึ้น Production
- **[../BACKEND_GUIDE.md](../BACKEND_GUIDE.md)** - คู่มือภาษาไทยฉบับสมบูรณ์ (20,000+ คำ)

---

## ⚡ Quick Start

```bash
# 1. Install dependencies
npm install

# 2. Setup environment
cp .env.example .env
# Edit .env with your MongoDB URI and JWT secret

# 3. Seed database
npm run seed

# 4. Start server
npm run start:dev
```

Server runs at: `http://localhost:3000/api`

---

## 🎯 Features

- ✅ User Authentication (JWT)
- ✅ Products CRUD API
- ✅ Category Filtering
- ✅ MongoDB Integration
- ✅ Input Validation
- ✅ Password Hashing
- ✅ CORS Enabled
- ✅ TypeScript
- ✅ Sample Data

---

## 📡 API Endpoints

### Authentication
- `POST /api/auth/register` - Register
- `POST /api/auth/login` - Login

### Products
- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get by ID
- `GET /api/products/category/:category` - Get by category
- `GET /api/products/categories` - Get all categories
- `POST /api/products` 🔒 - Create (requires auth)
- `PUT /api/products/:id` 🔒 - Update (requires auth)
- `DELETE /api/products/:id` 🔒 - Delete (requires auth)

🔒 = Requires JWT token in Authorization header

---

## 🔑 Demo Credentials

After running `npm run seed`:

**Regular User:**
```
Email: demo@test.com
Password: password
```

**Admin User:**
```
Email: admin@test.com
Password: admin123
```

---

## 🛠️ NPM Scripts

```bash
npm run start:dev       # Start development server
npm run start:prod      # Start production server
npm run build           # Build for production
npm run seed            # Seed database with sample data
npm run lint            # Lint code
npm run format          # Format code with Prettier
npm run test            # Run tests
```

---

## 📖 Documentation

### For Beginners
Start here: **[QUICKSTART_BACKEND.md](./QUICKSTART_BACKEND.md)**

### Complete Learning Guide
Full Thai tutorial: **[../BACKEND_GUIDE.md](../BACKEND_GUIDE.md)**

### Testing APIs
Examples and guides: **[API_TESTING.md](./API_TESTING.md)**

### Deployment
Production deployment: **[DEPLOYMENT.md](./DEPLOYMENT.md)**

---

## 🗄️ Database Schema

### User
- email (unique)
- password (hashed)
- name
- role
- isActive

### Product
- title
- price
- description
- category
- image
- rating { rate, count }
- inStock

### Category
- name (unique)
- description
- image
- isActive

### Order
- userId (ref)
- items [{ productId, quantity, price }]
- totalAmount
- status
- shippingAddress
- paymentMethod

---

## 🔐 Environment Variables

Create `.env` file:

```env
MONGODB_URI=mongodb://localhost:27017/flutter-lab-db
JWT_SECRET=your-super-secret-jwt-key
JWT_EXPIRATION=24h
PORT=3000
NODE_ENV=development
```

For MongoDB Atlas (Cloud):
```env
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/flutter-lab-db
```

---

## 🧪 Testing

### With cURL
```bash
# Health check
curl http://localhost:3000/api/health

# Get products
curl http://localhost:3000/api/products

# Login
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"demo@test.com","password":"password"}'
```

### With Postman
Import the collection from **[API_TESTING.md](./API_TESTING.md)**

---

## 🌐 Integration with Flutter

Update Flutter app's API service:

```dart
class ApiService {
  static const String baseUrl = 'http://localhost:3000/api';
  // For Android emulator: 'http://10.0.2.2:3000/api'
  // For iOS simulator: 'http://localhost:3000/api'
  
  String? _token;
  
  // Use token in headers
  Future<Map<String, String>> _getHeaders() async {
    return {
      'Content-Type': 'application/json',
      if (_token != null) 'Authorization': 'Bearer $_token',
    };
  }
}
```

---

## 📊 Project Structure

```
backend/
├── src/
│   ├── auth/           # Authentication module
│   ├── products/       # Products module
│   ├── schemas/        # MongoDB schemas
│   ├── dto/            # Data validation
│   ├── scripts/        # Utility scripts
│   └── main.ts         # Entry point
├── test/               # Tests
├── .env.example        # Environment template
└── package.json        # Dependencies
```

---

## 🤝 Contributing

1. Fork the repository
2. Create feature branch
3. Commit changes
4. Push and create Pull Request

---

## 📄 License

MIT License - Free to use for learning and commercial projects

---

## 🆘 Common Issues

### MongoDB Connection Failed
```bash
# Check MongoDB is running
# Windows: net start MongoDB
# Mac: brew services start mongodb-community
# Linux: sudo systemctl start mongod
```

### Port 3000 Already in Use
Change `PORT` in `.env` to another port (e.g., 3001)

### JWT_SECRET Not Found
Make sure `.env` file exists and has `JWT_SECRET` defined

---

## 📞 Support

- 📖 [Full Thai Guide](../BACKEND_GUIDE.md)
- 🐛 [Open Issue](https://github.com/somkheartk/flutter-lab-1-days/issues)
- 💬 [Discussions](https://github.com/somkheartk/flutter-lab-1-days/discussions)

---

**Made with ❤️ for Flutter learners**

**Happy Coding! 🚀**
