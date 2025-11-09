# API Testing Guide - ตัวอย่างการทดสอบ API

## 📚 รวม API Endpoints และตัวอย่างการใช้งาน

---

## 1. Health Check & Status

### 1.1 ตรวจสอบสถานะ API

```http
GET http://localhost:3000/api
```

**Response:**
```json
{
  "name": "Flutter Lab Backend API",
  "version": "1.0.0",
  "description": "NestJS + MongoDB Backend for Flutter Lab",
  "status": "running",
  "endpoints": {
    "auth": "/api/auth",
    "products": "/api/products",
    "health": "/api/health"
  }
}
```

### 1.2 Health Check

```http
GET http://localhost:3000/api/health
```

**Response:**
```json
{
  "status": "ok",
  "timestamp": "2024-11-09T05:00:00.000Z"
}
```

---

## 2. Authentication APIs

### 2.1 Register (สมัครสมาชิก)

```http
POST http://localhost:3000/api/auth/register
Content-Type: application/json

{
  "email": "newuser@example.com",
  "password": "password123",
  "name": "New User"
}
```

**Success Response (201):**
```json
{
  "user": {
    "id": "65789abcdef1234567890abc",
    "email": "newuser@example.com",
    "name": "New User"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NTc4OWFiY2RlZjEyMzQ1Njc4OTBhYmMiLCJlbWFpbCI6Im5ld3VzZXJAZXhhbXBsZS5jb20iLCJpYXQiOjE3MDI5ODAwMDAsImV4cCI6MTcwMzA2NjQwMH0.xxxx"
}
```

**Error Response (400) - Email already exists:**
```json
{
  "statusCode": 401,
  "message": "Email already registered"
}
```

**Error Response (400) - Validation error:**
```json
{
  "statusCode": 400,
  "message": [
    "email must be an email",
    "password must be longer than or equal to 6 characters"
  ],
  "error": "Bad Request"
}
```

### 2.2 Login (เข้าสู่ระบบ)

```http
POST http://localhost:3000/api/auth/login
Content-Type: application/json

{
  "email": "demo@test.com",
  "password": "password"
}
```

**Success Response (200):**
```json
{
  "user": {
    "id": "65789abcdef1234567890abc",
    "email": "demo@test.com",
    "name": "Demo User"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Error Response (401) - Invalid credentials:**
```json
{
  "statusCode": 401,
  "message": "Invalid credentials"
}
```

---

## 3. Products APIs (Public)

### 3.1 Get All Products

```http
GET http://localhost:3000/api/products
```

**Response (200):**
```json
[
  {
    "_id": "65789abcdef1234567890abc",
    "title": "iPhone 15 Pro Max",
    "price": 42900,
    "description": "iPhone 15 Pro Max พร้อม A17 Pro chip",
    "category": "smartphones",
    "image": "https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=400",
    "rating": {
      "rate": 4.8,
      "count": 156
    },
    "inStock": true,
    "createdAt": "2024-11-09T05:00:00.000Z",
    "updatedAt": "2024-11-09T05:00:00.000Z"
  },
  {
    "_id": "65789abcdef1234567890abd",
    "title": "Samsung Galaxy S24 Ultra",
    "price": 39900,
    "description": "Samsung Galaxy S24 Ultra พร้อม S Pen",
    "category": "smartphones",
    "image": "https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400",
    "rating": {
      "rate": 4.7,
      "count": 142
    },
    "inStock": true,
    "createdAt": "2024-11-09T05:00:00.000Z",
    "updatedAt": "2024-11-09T05:00:00.000Z"
  }
]
```

### 3.2 Get Product by ID

```http
GET http://localhost:3000/api/products/65789abcdef1234567890abc
```

**Success Response (200):**
```json
{
  "_id": "65789abcdef1234567890abc",
  "title": "iPhone 15 Pro Max",
  "price": 42900,
  "description": "iPhone 15 Pro Max พร้อม A17 Pro chip",
  "category": "smartphones",
  "image": "https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=400",
  "rating": {
    "rate": 4.8,
    "count": 156
  },
  "inStock": true,
  "createdAt": "2024-11-09T05:00:00.000Z",
  "updatedAt": "2024-11-09T05:00:00.000Z"
}
```

**Error Response (404):**
```json
{
  "statusCode": 404,
  "message": "Product not found"
}
```

### 3.3 Get All Categories

```http
GET http://localhost:3000/api/products/categories
```

**Response (200):**
```json
[
  "smartphones",
  "laptops",
  "tablets",
  "audio",
  "wearables",
  "televisions",
  "cameras"
]
```

### 3.4 Get Products by Category

```http
GET http://localhost:3000/api/products/category/smartphones
```

**Response (200):**
```json
[
  {
    "_id": "65789abcdef1234567890abc",
    "title": "iPhone 15 Pro Max",
    "price": 42900,
    "category": "smartphones",
    ...
  },
  {
    "_id": "65789abcdef1234567890abd",
    "title": "Samsung Galaxy S24 Ultra",
    "price": 39900,
    "category": "smartphones",
    ...
  }
]
```

---

## 4. Products APIs (Protected - ต้อง Login)

### 4.1 Create Product

```http
POST http://localhost:3000/api/products
Authorization: Bearer YOUR_JWT_TOKEN
Content-Type: application/json

{
  "title": "Test Product",
  "price": 999,
  "description": "This is a test product",
  "category": "electronics",
  "image": "https://via.placeholder.com/400",
  "rating": {
    "rate": 4.5,
    "count": 10
  }
}
```

**Success Response (201):**
```json
{
  "_id": "65789abcdef1234567890xyz",
  "title": "Test Product",
  "price": 999,
  "description": "This is a test product",
  "category": "electronics",
  "image": "https://via.placeholder.com/400",
  "rating": {
    "rate": 4.5,
    "count": 10
  },
  "inStock": true,
  "createdAt": "2024-11-09T05:30:00.000Z",
  "updatedAt": "2024-11-09T05:30:00.000Z"
}
```

**Error Response (401) - No token:**
```json
{
  "statusCode": 401,
  "message": "Unauthorized"
}
```

**Error Response (400) - Validation error:**
```json
{
  "statusCode": 400,
  "message": [
    "title must be a string",
    "price must be a positive number"
  ],
  "error": "Bad Request"
}
```

### 4.2 Update Product

```http
PUT http://localhost:3000/api/products/65789abcdef1234567890xyz
Authorization: Bearer YOUR_JWT_TOKEN
Content-Type: application/json

{
  "title": "Updated Product Name",
  "price": 1299
}
```

**Success Response (200):**
```json
{
  "_id": "65789abcdef1234567890xyz",
  "title": "Updated Product Name",
  "price": 1299,
  "description": "This is a test product",
  "category": "electronics",
  "image": "https://via.placeholder.com/400",
  "rating": {
    "rate": 4.5,
    "count": 10
  },
  "inStock": true,
  "createdAt": "2024-11-09T05:30:00.000Z",
  "updatedAt": "2024-11-09T06:00:00.000Z"
}
```

### 4.3 Delete Product

```http
DELETE http://localhost:3000/api/products/65789abcdef1234567890xyz
Authorization: Bearer YOUR_JWT_TOKEN
```

**Success Response (200):**
```json
{
  "message": "Product deleted successfully"
}
```

---

## 5. การใช้งานกับ Flutter

### 5.1 Update API Service ใน Flutter

```dart
// lib/services/api_service.dart

class ApiService {
  // เปลี่ยนจาก Fake Store API เป็น Backend API
  static const String baseUrl = 'http://localhost:3000/api';
  
  // สำหรับ Android Emulator ใช้
  // static const String baseUrl = 'http://10.0.2.2:3000/api';
  
  // สำหรับ iOS Simulator ใช้
  // static const String baseUrl = 'http://localhost:3000/api';
  
  String? _token;
  
  void setToken(String token) {
    _token = token;
  }
  
  Future<Map<String, String>> _getHeaders({bool requireAuth = false}) async {
    final headers = {
      'Content-Type': 'application/json',
    };
    
    if (requireAuth && _token != null) {
      headers['Authorization'] = 'Bearer $_token';
    }
    
    return headers;
  }
  
  // Login
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: await _getHeaders(),
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _token = data['token'];
      return data;
    } else {
      throw Exception('Login failed');
    }
  }
  
  // Get Products
  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/products'),
      headers: await _getHeaders(),
    );
    
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
```

---

## 6. ตัวอย่างการทดสอบด้วย cURL

### Register
```bash
curl -X POST http://localhost:3000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "password123",
    "name": "Test User"
  }'
```

### Login
```bash
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "demo@test.com",
    "password": "password"
  }'
```

### Get Products
```bash
curl http://localhost:3000/api/products
```

### Create Product (with token)
```bash
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -d '{
    "title": "New Product",
    "price": 999,
    "description": "Test description",
    "category": "electronics",
    "image": "https://via.placeholder.com/400"
  }'
```

---

## 7. Postman Collection

### Import ลง Postman:

1. เปิด Postman
2. คลิก **Import**
3. วาง JSON นี้:

```json
{
  "info": {
    "name": "Flutter Lab Backend API",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "variable": [
    {
      "key": "baseUrl",
      "value": "http://localhost:3000/api"
    },
    {
      "key": "token",
      "value": ""
    }
  ],
  "item": [
    {
      "name": "Auth",
      "item": [
        {
          "name": "Register",
          "request": {
            "method": "POST",
            "url": "{{baseUrl}}/auth/register",
            "header": [
              {
                "key": "Content-Type",
                "value": "application/json"
              }
            ],
            "body": {
              "mode": "raw",
              "raw": "{\n  \"email\": \"test@example.com\",\n  \"password\": \"password123\",\n  \"name\": \"Test User\"\n}"
            }
          }
        },
        {
          "name": "Login",
          "request": {
            "method": "POST",
            "url": "{{baseUrl}}/auth/login",
            "header": [
              {
                "key": "Content-Type",
                "value": "application/json"
              }
            ],
            "body": {
              "mode": "raw",
              "raw": "{\n  \"email\": \"demo@test.com\",\n  \"password\": \"password\"\n}"
            }
          }
        }
      ]
    },
    {
      "name": "Products",
      "item": [
        {
          "name": "Get All Products",
          "request": {
            "method": "GET",
            "url": "{{baseUrl}}/products"
          }
        },
        {
          "name": "Get Product by ID",
          "request": {
            "method": "GET",
            "url": "{{baseUrl}}/products/PRODUCT_ID"
          }
        },
        {
          "name": "Get Categories",
          "request": {
            "method": "GET",
            "url": "{{baseUrl}}/products/categories"
          }
        },
        {
          "name": "Create Product",
          "request": {
            "method": "POST",
            "url": "{{baseUrl}}/products",
            "header": [
              {
                "key": "Content-Type",
                "value": "application/json"
              },
              {
                "key": "Authorization",
                "value": "Bearer {{token}}"
              }
            ],
            "body": {
              "mode": "raw",
              "raw": "{\n  \"title\": \"Test Product\",\n  \"price\": 999,\n  \"description\": \"Test description\",\n  \"category\": \"electronics\",\n  \"image\": \"https://via.placeholder.com/400\"\n}"
            }
          }
        }
      ]
    }
  ]
}
```

---

## 8. Common HTTP Status Codes

| Code | ความหมาย | ตัวอย่าง |
|------|----------|----------|
| 200 | OK | GET สำเร็จ |
| 201 | Created | POST สร้างสำเร็จ |
| 400 | Bad Request | ข้อมูลไม่ถูกต้อง |
| 401 | Unauthorized | ไม่ได้ Login หรือ Token ผิด |
| 403 | Forbidden | ไม่มีสิทธิ์เข้าถึง |
| 404 | Not Found | ไม่พบข้อมูล |
| 500 | Server Error | Error ใน Server |

---

**Happy Testing! 🧪**
