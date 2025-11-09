import * as mongoose from 'mongoose';
import * as bcrypt from 'bcrypt';
import * as dotenv from 'dotenv';
import { Product } from '../schemas/product.schema';
import { User } from '../schemas/user.schema';

// Load environment variables
dotenv.config();

const sampleProducts = [
  {
    title: 'iPhone 15 Pro Max',
    price: 42900,
    description: 'iPhone 15 Pro Max พร้อม A17 Pro chip, กล้อง 48MP และ Titanium Design',
    category: 'smartphones',
    image: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=400',
    rating: { rate: 4.8, count: 156 },
    inStock: true,
  },
  {
    title: 'Samsung Galaxy S24 Ultra',
    price: 39900,
    description: 'Samsung Galaxy S24 Ultra พร้อม S Pen และกล้อง 200MP',
    category: 'smartphones',
    image: 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400',
    rating: { rate: 4.7, count: 142 },
    inStock: true,
  },
  {
    title: 'MacBook Pro 14" M3',
    price: 69900,
    description: 'MacBook Pro 14" พร้อม M3 chip สมรรถนะสูงสุด',
    category: 'laptops',
    image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
    rating: { rate: 4.9, count: 203 },
    inStock: true,
  },
  {
    title: 'Dell XPS 15',
    price: 55900,
    description: 'Dell XPS 15 จอ 4K OLED, Intel i9, RTX 4060',
    category: 'laptops',
    image: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=400',
    rating: { rate: 4.6, count: 98 },
    inStock: true,
  },
  {
    title: 'iPad Pro 12.9"',
    price: 39900,
    description: 'iPad Pro 12.9" พร้อม M2 chip และ Apple Pencil',
    category: 'tablets',
    image: 'https://images.unsplash.com/photo-1585790050230-5dd28404f242?w=400',
    rating: { rate: 4.8, count: 167 },
    inStock: true,
  },
  {
    title: 'Samsung Galaxy Tab S9',
    price: 29900,
    description: 'Samsung Galaxy Tab S9 จอ 120Hz พร้อม S Pen',
    category: 'tablets',
    image: 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400',
    rating: { rate: 4.5, count: 89 },
    inStock: true,
  },
  {
    title: 'AirPods Pro (Gen 2)',
    price: 8900,
    description: 'AirPods Pro รุ่นที่ 2 พร้อม Active Noise Cancellation',
    category: 'audio',
    image: 'https://images.unsplash.com/photo-1606841837239-c5a1a4a07af7?w=400',
    rating: { rate: 4.7, count: 234 },
    inStock: true,
  },
  {
    title: 'Sony WH-1000XM5',
    price: 12900,
    description: 'Sony WH-1000XM5 หูฟังตัดเสียงรบกวนระดับท็อป',
    category: 'audio',
    image: 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=400',
    rating: { rate: 4.9, count: 312 },
    inStock: true,
  },
  {
    title: 'Apple Watch Series 9',
    price: 13900,
    description: 'Apple Watch Series 9 พร้อม Always-On Retina Display',
    category: 'wearables',
    image: 'https://images.unsplash.com/photo-1434493907317-a46b5bbe7834?w=400',
    rating: { rate: 4.8, count: 189 },
    inStock: true,
  },
  {
    title: 'Samsung Galaxy Watch 6',
    price: 10900,
    description: 'Samsung Galaxy Watch 6 ติดตามสุขภาพแบบครบวงจร',
    category: 'wearables',
    image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
    rating: { rate: 4.6, count: 145 },
    inStock: true,
  },
  {
    title: 'LG OLED TV 65"',
    price: 69900,
    description: 'LG OLED TV 65" 4K HDR พร้อม webOS',
    category: 'televisions',
    image: 'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=400',
    rating: { rate: 4.7, count: 87 },
    inStock: true,
  },
  {
    title: 'Canon EOS R6 Mark II',
    price: 89900,
    description: 'Canon EOS R6 Mark II กล้อง Mirrorless Full-frame',
    category: 'cameras',
    image: 'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=400',
    rating: { rate: 4.9, count: 76 },
    inStock: true,
  },
];

const sampleUsers = [
  {
    email: 'demo@test.com',
    password: 'password',
    name: 'Demo User',
    role: 'user',
  },
  {
    email: 'admin@test.com',
    password: 'admin123',
    name: 'Admin User',
    role: 'admin',
  },
];

async function seedDatabase() {
  try {
    // Connect to MongoDB
    const mongoUri = process.env.MONGODB_URI || 'mongodb://localhost:27017/flutter-lab-db';
    await mongoose.connect(mongoUri);
    console.log('✅ Connected to MongoDB');

    // Clear existing data
    await mongoose.connection.collection('products').deleteMany({});
    await mongoose.connection.collection('users').deleteMany({});
    console.log('🗑️  Cleared existing data');

    // Insert products
    await mongoose.connection.collection('products').insertMany(sampleProducts);
    console.log(`✅ Inserted ${sampleProducts.length} products`);

    // Insert users with hashed passwords
    const usersWithHashedPasswords = await Promise.all(
      sampleUsers.map(async (user) => ({
        ...user,
        password: await bcrypt.hash(user.password, 10),
      })),
    );
    
    await mongoose.connection.collection('users').insertMany(usersWithHashedPasswords);
    console.log(`✅ Inserted ${sampleUsers.length} users`);

    console.log('\n🎉 Database seeded successfully!');
    console.log('\n📝 Demo credentials:');
    console.log('   Email: demo@test.com');
    console.log('   Password: password');
    console.log('\n   Email: admin@test.com');
    console.log('   Password: admin123');

    process.exit(0);
  } catch (error) {
    console.error('❌ Error seeding database:', error);
    process.exit(1);
  }
}

seedDatabase();
