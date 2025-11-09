# Flutter Lab Backend API

NestJS + MongoDB backend for Flutter Lab 1 Days project.

## 🚀 Features

- **User Authentication**: Register, Login with JWT tokens
- **Products Management**: CRUD operations for products
- **Categories**: Product categorization
- **MongoDB Integration**: NoSQL database with Mongoose
- **Input Validation**: Class-validator for request validation
- **Security**: Password hashing with bcrypt, JWT authentication
- **CORS Enabled**: Ready for Flutter app integration

## 📋 Prerequisites

- Node.js 18+ and npm
- MongoDB (local or cloud instance like MongoDB Atlas)

## 🔧 Installation

1. Install dependencies:
```bash
npm install
```

2. Configure environment variables:
```bash
cp .env.example .env
```

Edit `.env` file:
```env
MONGODB_URI=mongodb://localhost:27017/flutter-lab-db
JWT_SECRET=your-super-secret-jwt-key
JWT_EXPIRATION=24h
PORT=3000
NODE_ENV=development
```

3. Seed the database with sample data:
```bash
npm run seed
```

## 🏃 Running the Application

### Development mode
```bash
npm run start:dev
```

### Production mode
```bash
npm run build
npm run start:prod
```

The API will be available at `http://localhost:3000/api`

## 📚 API Endpoints

### Health Check
- `GET /api` - API status
- `GET /api/health` - Health check

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user

### Products
- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get product by ID
- `GET /api/products/category/:category` - Get products by category
- `GET /api/products/categories` - Get all categories
- `POST /api/products` - Create product (requires auth)
- `PUT /api/products/:id` - Update product (requires auth)
- `DELETE /api/products/:id` - Delete product (requires auth)

## 🔐 Authentication

Protected routes require a JWT token in the Authorization header:
```
Authorization: Bearer <your-jwt-token>
```

## 📝 Sample Data

After running `npm run seed`, you can use these credentials:

**Regular User:**
- Email: demo@test.com
- Password: password

**Admin User:**
- Email: admin@test.com
- Password: admin123

## 🗄️ Database Schema

### User
- email (unique)
- password (hashed)
- name
- role (default: 'user')
- isActive (default: true)

### Product
- title
- price
- description
- category
- image (URL)
- rating (rate, count)
- inStock (default: true)

## 🛠️ Development

### Linting
```bash
npm run lint
```

### Testing
```bash
npm run test
npm run test:e2e
```

## 📖 Learn More

- [NestJS Documentation](https://docs.nestjs.com)
- [MongoDB Documentation](https://docs.mongodb.com)
- [Mongoose Documentation](https://mongoosejs.com)

## 🤝 Integration with Flutter

Update your Flutter app's API service to point to:
```dart
static const String baseUrl = 'http://localhost:3000/api';
```

For Android emulator, use: `http://10.0.2.2:3000/api`
For iOS simulator, use: `http://localhost:3000/api`

---

Created for Flutter Lab 1 Days learning project 🚀
