# คู่มือ Backend - NestJS + MongoDB (ภาษาไทย)

## 📚 สารบัญ

1. [บทนำ](#บทนำ)
2. [สิ่งที่จะได้เรียนรู้](#สิ่งที่จะได้เรียนรู้)
3. [พื้นฐาน NestJS](#พื้นฐาน-nestjs)
4. [พื้นฐาน MongoDB](#พื้นฐาน-mongodb)
5. [โครงสร้างโปรเจค](#โครงสร้างโปรเจค)
6. [การสร้าง API](#การสร้าง-api)
7. [Authentication & Authorization](#authentication--authorization)
8. [การทำงานกับ Database](#การทำงานกับ-database)
9. [การทดสอบ API](#การทดสอบ-api)
10. [Best Practices](#best-practices)

---

## บทนำ

คู่มือนี้จะพาคุณเรียนรู้การสร้าง Backend API ด้วย **NestJS** และ **MongoDB** แบบละเอียดทุกขั้นตอน เหมาะสำหรับผู้เริ่มต้นที่ต้องการเรียนรู้การพัฒนา Backend แบบมืออาชีพ

### NestJS คืออะไร?

NestJS เป็น Framework สำหรับสร้าง Backend ด้วย Node.js ที่:
- ✅ เขียนด้วย TypeScript (Type-safe)
- ✅ มีโครงสร้างที่ชัดเจน (Modular Architecture)
- ✅ เหมาะกับการทำโปรเจคใหญ่
- ✅ มี Dependency Injection built-in
- ✅ รองรับ REST API, GraphQL, WebSockets

### MongoDB คืออะไร?

MongoDB เป็น NoSQL Database ที่:
- ✅ เก็บข้อมูลแบบ JSON (Document-based)
- ✅ ยืดหยุ่น ไม่ต้องกำหนด Schema ตายตัว
- ✅ ประสิทธิภาพสูง สำหรับข้อมูลจำนวนมาก
- ✅ Scale ได้ง่าย
- ✅ มี Cloud service (MongoDB Atlas) ใช้ฟรี

---

## สิ่งที่จะได้เรียนรู้

### 1. พื้นฐาน Backend
- REST API คืออะไร
- HTTP Methods (GET, POST, PUT, DELETE)
- Status Codes (200, 404, 500, etc.)
- Request & Response
- Headers & Body

### 2. NestJS Framework
- Modules, Controllers, Services
- Dependency Injection
- Decorators (@Controller, @Get, @Post, etc.)
- Pipes & Validation
- Guards & Middleware

### 3. MongoDB & Mongoose
- Collections & Documents
- Schemas & Models
- CRUD Operations
- Query & Aggregation
- Relationships

### 4. Authentication
- JWT (JSON Web Tokens)
- Password Hashing (bcrypt)
- Protected Routes
- Role-based Access Control

---

## พื้นฐาน NestJS

### 1. โครงสร้างพื้นฐาน

NestJS ใช้ **Modular Architecture** แบ่งเป็น 3 ส่วนหลัก:

#### Module (โมดูล)
```typescript
@Module({
  imports: [],      // โมดูลอื่นที่ต้องใช้
  controllers: [],  // Controllers ในโมดูลนี้
  providers: [],    // Services ในโมดูลนี้
  exports: [],      // ส่งออกให้โมดูลอื่นใช้
})
export class ProductsModule {}
```

**คำอธิบาย:**
- Module คือกล่องที่รวม Controllers และ Services เข้าด้วยกัน
- แต่ละ Feature ควรมี Module ของตัวเอง
- ช่วยแบ่งโค้ดให้เป็นระเบียบ

#### Controller (ตัวควบคุม)
```typescript
@Controller('products')  // URL: /api/products
export class ProductsController {
  constructor(private productsService: ProductsService) {}

  @Get()  // GET /api/products
  getAllProducts() {
    return this.productsService.findAll();
  }

  @Get(':id')  // GET /api/products/123
  getProduct(@Param('id') id: string) {
    return this.productsService.findById(id);
  }

  @Post()  // POST /api/products
  createProduct(@Body() data: CreateProductDto) {
    return this.productsService.create(data);
  }
}
```

**คำอธิบาย:**
- Controller รับ HTTP Request และส่งต่อให้ Service
- ใช้ Decorators (@Get, @Post, etc.) กำหนด Routes
- @Param() รับค่าจาก URL
- @Body() รับข้อมูลจาก Request Body
- @Query() รับค่าจาก Query String

#### Service (บริการ)
```typescript
@Injectable()
export class ProductsService {
  constructor(
    @InjectModel(Product.name) 
    private productModel: Model<ProductDocument>
  ) {}

  async findAll(): Promise<Product[]> {
    return this.productModel.find().exec();
  }

  async findById(id: string): Promise<Product> {
    const product = await this.productModel.findById(id).exec();
    if (!product) {
      throw new NotFoundException('Product not found');
    }
    return product;
  }

  async create(data: CreateProductDto): Promise<Product> {
    const product = new this.productModel(data);
    return product.save();
  }
}
```

**คำอธิบาย:**
- Service จัดการ Business Logic และติดต่อ Database
- @Injectable() ทำให้สามารถ Inject ได้
- แยก Logic ออกจาก Controller เพื่อ Reusability

### 2. Dependency Injection (DI)

```typescript
// การ Inject Service เข้า Controller
@Controller('products')
export class ProductsController {
  constructor(
    private productsService: ProductsService  // <-- Inject ที่นี่
  ) {}
}
```

**คำอธิบาย:**
- DI คือการส่ง Dependencies ผ่าน Constructor
- ไม่ต้อง `new ProductsService()` เอง
- NestJS จัดการให้อัตโนมัติ
- ง่ายต่อการทดสอบและเปลี่ยนแปลง

### 3. Decorators สำคัญ

| Decorator | ใช้งาน |
|-----------|--------|
| @Module() | กำหนด Module |
| @Controller() | กำหนด Controller |
| @Injectable() | กำหนด Service |
| @Get() | HTTP GET |
| @Post() | HTTP POST |
| @Put() | HTTP PUT |
| @Delete() | HTTP DELETE |
| @Param() | รับค่าจาก URL Parameter |
| @Body() | รับค่าจาก Request Body |
| @Query() | รับค่าจาก Query String |
| @UseGuards() | ใช้ Guard ป้องกัน Route |

---

## พื้นฐาน MongoDB

### 1. ความแตกต่างระหว่าง SQL และ NoSQL

| SQL (MySQL, PostgreSQL) | NoSQL (MongoDB) |
|------------------------|-----------------|
| Tables | Collections |
| Rows | Documents |
| Columns | Fields |
| ต้องกำหนด Schema | Schema ยืดหยุ่น |
| Relationships (Foreign Keys) | Embedded Documents |

### 2. Document Structure

MongoDB เก็บข้อมูลเป็น JSON:

```json
{
  "_id": "507f1f77bcf86cd799439011",
  "title": "iPhone 15 Pro Max",
  "price": 42900,
  "description": "iPhone รุ่นล่าสุด",
  "category": "smartphones",
  "rating": {
    "rate": 4.8,
    "count": 156
  },
  "createdAt": "2024-01-15T10:30:00.000Z",
  "updatedAt": "2024-01-15T10:30:00.000Z"
}
```

### 3. Schema & Model

Mongoose ช่วยกำหนดโครงสร้างข้อมูล:

```typescript
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

// 1. สร้าง Type
export type ProductDocument = Product & Document;

// 2. สร้าง Schema
@Schema({ timestamps: true })  // เพิ่ม createdAt, updatedAt อัตโนมัติ
export class Product {
  @Prop({ required: true })  // Field บังคับ
  title: string;

  @Prop({ required: true })
  price: number;

  @Prop()  // Field ไม่บังคับ
  description: string;

  @Prop({ default: true })  // ค่า default
  inStock: boolean;

  @Prop({
    type: { rate: Number, count: Number },
    default: { rate: 0, count: 0 }
  })
  rating: {
    rate: number;
    count: number;
  };
}

// 3. สร้าง Schema Factory
export const ProductSchema = SchemaFactory.createForClass(Product);
```

**คำอธิบาย Decorators:**
- `@Schema()` - กำหนดว่าเป็น Schema
- `@Prop()` - กำหนด Property/Field
- `required: true` - Field บังคับต้องมี
- `unique: true` - ต้องไม่ซ้ำ
- `default: value` - ค่าเริ่มต้น
- `timestamps: true` - เพิ่ม createdAt, updatedAt

### 4. CRUD Operations

#### Create (สร้าง)
```typescript
async create(data: CreateProductDto): Promise<Product> {
  const product = new this.productModel(data);
  return product.save();
}
```

#### Read (อ่าน)
```typescript
// หาทั้งหมด
async findAll(): Promise<Product[]> {
  return this.productModel.find().exec();
}

// หาด้วย ID
async findById(id: string): Promise<Product> {
  return this.productModel.findById(id).exec();
}

// หาด้วยเงื่อนไข
async findByCategory(category: string): Promise<Product[]> {
  return this.productModel.find({ category }).exec();
}

// หาตัวแรก
async findOne(email: string): Promise<User> {
  return this.userModel.findOne({ email }).exec();
}
```

#### Update (แก้ไข)
```typescript
async update(id: string, data: UpdateProductDto): Promise<Product> {
  return this.productModel
    .findByIdAndUpdate(id, data, { new: true })  // new: true = คืนค่าใหม่
    .exec();
}
```

#### Delete (ลบ)
```typescript
async remove(id: string): Promise<void> {
  await this.productModel.findByIdAndDelete(id).exec();
}
```

### 5. Query Methods

```typescript
// หาและเรียงลำดับ
await this.productModel.find().sort({ price: -1 }).exec();  // -1 = มากไปน้อย

// จำกัดจำนวน
await this.productModel.find().limit(10).exec();

// ข้ามบางรายการ (Pagination)
await this.productModel.find().skip(20).limit(10).exec();

// เลือกเฉพาะ Fields
await this.productModel.find().select('title price').exec();

// นับจำนวน
await this.productModel.countDocuments({ category: 'smartphones' }).exec();

// หา Distinct
await this.productModel.distinct('category').exec();
```

---

## โครงสร้างโปรเจค

```
backend/
├── src/
│   ├── main.ts                 # Entry point
│   ├── app.module.ts           # Root module
│   ├── app.controller.ts       # Root controller
│   ├── app.service.ts          # Root service
│   │
│   ├── auth/                   # Authentication module
│   │   ├── auth.module.ts
│   │   ├── auth.controller.ts
│   │   ├── auth.service.ts
│   │   ├── jwt.strategy.ts     # JWT Strategy
│   │   └── jwt-auth.guard.ts   # JWT Guard
│   │
│   ├── products/               # Products module
│   │   ├── products.module.ts
│   │   ├── products.controller.ts
│   │   └── products.service.ts
│   │
│   ├── schemas/                # Mongoose schemas
│   │   ├── user.schema.ts
│   │   ├── product.schema.ts
│   │   ├── category.schema.ts
│   │   └── order.schema.ts
│   │
│   ├── dto/                    # Data Transfer Objects
│   │   ├── auth.dto.ts
│   │   └── product.dto.ts
│   │
│   └── scripts/                # Utility scripts
│       └── seed.ts             # Database seeding
│
├── .env                        # Environment variables
├── .env.example                # Example env file
├── package.json                # Dependencies
└── tsconfig.json               # TypeScript config
```

---

## การสร้าง API

### 1. สร้าง Module ใหม่

```bash
# สร้าง Products module
nest g module products
nest g controller products
nest g service products
```

### 2. สร้าง DTO (Data Transfer Object)

DTO ใช้สำหรับ Validation:

```typescript
// dto/product.dto.ts
import { IsString, IsNumber, Min } from 'class-validator';

export class CreateProductDto {
  @IsString()
  title: string;

  @IsNumber()
  @Min(0)
  price: number;

  @IsString()
  description: string;

  @IsString()
  category: string;
}
```

**Validation Decorators:**
- `@IsString()` - ต้องเป็น string
- `@IsNumber()` - ต้องเป็น number
- `@IsEmail()` - ต้องเป็น email
- `@MinLength(6)` - ความยาวขั้นต่ำ
- `@Min(0)` - ค่าขั้นต่ำ
- `@IsOptional()` - ไม่บังคับ

### 3. เปิดใช้ Validation

```typescript
// main.ts
app.useGlobalPipes(
  new ValidationPipe({
    whitelist: true,        // ลบ fields ที่ไม่ต้องการ
    transform: true,        // แปลงเป็น DTO class
    forbidNonWhitelisted: true,  // error ถ้ามี field เกิน
  }),
);
```

---

## Authentication & Authorization

### 1. JWT (JSON Web Token)

JWT เป็น Token สำหรับยืนยันตัวตน:

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
eyJzdWIiOiI2NTc4OTBhYmNkZWYiLCJlbWFpbCI6ImRlbW9AdGVzdC5jb20ifQ.
SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```

ประกอบด้วย 3 ส่วน:
1. **Header** - Algorithm + Type
2. **Payload** - ข้อมูล (userId, email, etc.)
3. **Signature** - ลายเซ็นดิจิทัล

### 2. Register (สมัครสมาชิก)

```typescript
async register(registerDto: RegisterDto) {
  // 1. เช็คว่า email ซ้ำหรือไม่
  const existingUser = await this.userModel.findOne({
    email: registerDto.email,
  });
  
  if (existingUser) {
    throw new UnauthorizedException('Email already registered');
  }

  // 2. Hash password
  const hashedPassword = await bcrypt.hash(registerDto.password, 10);

  // 3. สร้าง User ใหม่
  const user = new this.userModel({
    ...registerDto,
    password: hashedPassword,
  });
  await user.save();

  // 4. สร้าง JWT Token
  const token = this.jwtService.sign({
    sub: user._id,
    email: user.email,
  });

  return { user, token };
}
```

**คำอธิบาย:**
- `bcrypt.hash()` - เข้ารหัสรหัสผ่าน (ไม่สามารถถอดรหัสกลับได้)
- `10` - Salt rounds (ยิ่งมากยิ่งปลอดภัย แต่ช้ากว่า)
- `jwtService.sign()` - สร้าง Token

### 3. Login (เข้าสู่ระบบ)

```typescript
async login(loginDto: LoginDto) {
  // 1. หา User
  const user = await this.userModel.findOne({ 
    email: loginDto.email 
  });
  
  if (!user) {
    throw new UnauthorizedException('Invalid credentials');
  }

  // 2. ตรวจสอบรหัสผ่าน
  const isPasswordValid = await bcrypt.compare(
    loginDto.password,
    user.password,
  );

  if (!isPasswordValid) {
    throw new UnauthorizedException('Invalid credentials');
  }

  // 3. สร้าง Token
  const token = this.jwtService.sign({
    sub: user._id,
    email: user.email,
  });

  return { user, token };
}
```

**คำอธิบาย:**
- `bcrypt.compare()` - เปรียบเทียบรหัสผ่าน
- ไม่บอกว่า email หรือ password ผิด (Security)

### 4. JWT Strategy

```typescript
@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(
    private configService: ConfigService,
    private authService: AuthService,
  ) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: configService.get<string>('JWT_SECRET'),
    });
  }

  async validate(payload: any) {
    // payload = { sub: userId, email: email }
    return this.authService.validateUser(payload.sub);
  }
}
```

### 5. ป้องกัน Route ด้วย Guard

```typescript
@Controller('products')
export class ProductsController {
  // Route นี้ต้อง Login ก่อน
  @Post()
  @UseGuards(JwtAuthGuard)  // <-- ใช้ Guard
  createProduct(@Body() data: CreateProductDto) {
    return this.productsService.create(data);
  }

  // Route นี้ไม่ต้อง Login
  @Get()
  getAllProducts() {
    return this.productsService.findAll();
  }
}
```

### 6. การใช้งาน Token

```bash
# 1. Register/Login เพื่อรับ Token
POST http://localhost:3000/api/auth/login
{
  "email": "demo@test.com",
  "password": "password"
}

# Response:
{
  "user": {...},
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}

# 2. ใช้ Token ในการเรียก Protected Routes
GET http://localhost:3000/api/products
Headers:
  Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

---

## การทำงานกับ Database

### 1. การเชื่อมต่อ MongoDB

```typescript
// app.module.ts
MongooseModule.forRootAsync({
  imports: [ConfigModule],
  inject: [ConfigService],
  useFactory: async (configService: ConfigService) => ({
    uri: configService.get<string>('MONGODB_URI'),
  }),
}),
```

### 2. การ Import Schema

```typescript
// products.module.ts
@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Product.name, schema: ProductSchema }
    ]),
  ],
  ...
})
```

### 3. Relationships

#### One-to-Many (User -> Orders)
```typescript
// order.schema.ts
@Schema()
export class Order {
  @Prop({ type: Types.ObjectId, ref: 'User', required: true })
  userId: Types.ObjectId;
  
  // ... other fields
}

// ดึงข้อมูล Order พร้อม User
await this.orderModel.find().populate('userId').exec();
```

#### Many-to-Many (Orders -> Products)
```typescript
@Schema()
export class Order {
  @Prop({
    type: [{
      productId: { type: Types.ObjectId, ref: 'Product' },
      quantity: Number,
    }]
  })
  items: Array<{
    productId: Types.ObjectId;
    quantity: number;
  }>;
}
```

### 4. Indexes

เพิ่มความเร็วในการค้นหา:

```typescript
@Schema()
export class Product {
  @Prop({ index: true })  // สร้าง index
  category: string;

  @Prop({ unique: true })  // unique index
  sku: string;
}

// หรือสร้างแบบ compound index
ProductSchema.index({ category: 1, price: -1 });
```

---

## การทดสอบ API

### 1. ใช้ Postman

**Install Postman:** https://www.postman.com/downloads/

**ทดสอบ Register:**
```
POST http://localhost:3000/api/auth/register
Body (JSON):
{
  "email": "test@example.com",
  "password": "password123",
  "name": "Test User"
}
```

**ทดสอบ Login:**
```
POST http://localhost:3000/api/auth/login
Body (JSON):
{
  "email": "test@example.com",
  "password": "password123"
}
```

**ทดสอบ Get Products:**
```
GET http://localhost:3000/api/products
```

### 2. ใช้ cURL

```bash
# Register
curl -X POST http://localhost:3000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"password123","name":"Test"}'

# Login
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"password123"}'

# Get Products (with token)
curl http://localhost:3000/api/products \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

### 3. ใช้ HTTPie (สวยกว่า cURL)

```bash
# Install
pip install httpie

# Register
http POST localhost:3000/api/auth/register \
  email=test@example.com \
  password=password123 \
  name="Test User"

# Get Products
http GET localhost:3000/api/products \
  Authorization:"Bearer YOUR_TOKEN"
```

---

## Best Practices

### 1. Error Handling

```typescript
// ใช้ Built-in Exceptions
throw new NotFoundException('Product not found');
throw new BadRequestException('Invalid data');
throw new UnauthorizedException('Please login');
throw new ForbiddenException('Access denied');

// สร้าง Custom Exception
export class ProductNotFoundException extends NotFoundException {
  constructor(id: string) {
    super(`Product with ID ${id} not found`);
  }
}
```

### 2. Environment Variables

```typescript
// .env
DATABASE_URL=mongodb://localhost:27017/mydb
JWT_SECRET=super-secret-key
PORT=3000

// ใช้งาน
this.configService.get<string>('JWT_SECRET')
```

### 3. Logging

```typescript
import { Logger } from '@nestjs/common';

export class ProductsService {
  private readonly logger = new Logger(ProductsService.name);

  async create(data: CreateProductDto) {
    this.logger.log('Creating new product');
    // ...
    this.logger.debug(`Product created: ${product.id}`);
  }
}
```

### 4. DTO Transformation

```typescript
// ไม่ส่ง password กลับไป
export class UserResponseDto {
  id: string;
  email: string;
  name: string;
  
  constructor(user: User) {
    this.id = user._id;
    this.email = user.email;
    this.name = user.name;
    // ไม่มี password
  }
}
```

### 5. Pagination

```typescript
async findAll(page: number = 1, limit: number = 10) {
  const skip = (page - 1) * limit;
  
  const [data, total] = await Promise.all([
    this.productModel.find().skip(skip).limit(limit).exec(),
    this.productModel.countDocuments().exec(),
  ]);
  
  return {
    data,
    meta: {
      page,
      limit,
      total,
      totalPages: Math.ceil(total / limit),
    },
  };
}
```

### 6. Soft Delete

```typescript
@Schema()
export class Product {
  @Prop({ default: false })
  isDeleted: boolean;

  @Prop()
  deletedAt?: Date;
}

// Service
async softDelete(id: string) {
  return this.productModel.findByIdAndUpdate(id, {
    isDeleted: true,
    deletedAt: new Date(),
  });
}

// แสดงเฉพาะที่ยังไม่ลบ
async findAll() {
  return this.productModel.find({ isDeleted: false }).exec();
}
```

---

## คำศัพท์สำคัญ

| คำศัพท์ | ความหมาย |
|---------|----------|
| API | Application Programming Interface - ช่องทางติดต่อระหว่างโปรแกรม |
| REST | Representational State Transfer - รูปแบบการออกแบบ API |
| Endpoint | URL ที่ใช้เรียก API |
| Controller | ตัวรับ Request และส่งต่อให้ Service |
| Service | ตัวจัดการ Business Logic |
| DTO | Data Transfer Object - โครงสร้างข้อมูลสำหรับรับส่ง |
| Schema | โครงสร้างข้อมูลใน Database |
| Model | ตัวแทนของ Collection ใน MongoDB |
| Middleware | ฟังก์ชันที่ทำงานก่อน/หลัง Request |
| Guard | ตัวป้องกัน Route |
| Pipe | ตัวแปลงและ Validate ข้อมูล |
| JWT | JSON Web Token - Token สำหรับยืนยันตัวตน |
| Hash | เข้ารหัสแบบทางเดียว |
| CRUD | Create, Read, Update, Delete |

---

## แหล่งเรียนรู้เพิ่มเติม

### เอกสารทางการ
- [NestJS Documentation](https://docs.nestjs.com)
- [MongoDB Manual](https://docs.mongodb.com/manual/)
- [Mongoose Documentation](https://mongoosejs.com/docs/)

### คอร์สออนไลน์
- [NestJS Zero to Hero](https://www.udemy.com/course/nestjs-zero-to-hero/)
- [MongoDB University](https://university.mongodb.com/)

### YouTube Channels
- Traversy Media
- The Net Ninja
- Academind

### Community
- [NestJS Discord](https://discord.gg/nestjs)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/nestjs)
- [Reddit r/nestjs](https://reddit.com/r/nestjs)

---

## สรุป

คุณได้เรียนรู้:
- ✅ พื้นฐาน NestJS และ MongoDB
- ✅ การสร้าง REST API
- ✅ Authentication ด้วย JWT
- ✅ การทำงานกับ Database
- ✅ Best Practices

### ขั้นตอนต่อไป:
1. ✅ ทดลองสร้าง API ของตัวเอง
2. ✅ เพิ่ม Features เช่น Search, Filter, Sort
3. ✅ เขียน Tests
4. ✅ Deploy ขึ้น Cloud (Heroku, Railway, etc.)
5. ✅ เชื่อมต่อกับ Flutter App

---

**สนุกกับการเขียน Backend! 🚀**

หากมีคำถาม สามารถเปิด Issue ใน GitHub ได้เลย
