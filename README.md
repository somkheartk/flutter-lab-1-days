# Flutter Lab 1 Days - E-commerce Learning Project

🎯 **Learn Flutter + Backend in 1 Day!** A comprehensive hands-on lab for beginners to learn full-stack mobile development with Flutter and NestJS.

## 📚 What You'll Learn

This project teaches you how to build a complete full-stack application including:

**Frontend (Flutter):**
- ✅ User authentication (Login screen)
- ✅ State management with Provider
- ✅ API integration
- ✅ Navigation between screens
- ✅ Product listing (E-commerce)
- ✅ Product details
- ✅ Profile/Contact page
- ✅ Form validation
- ✅ Network image loading
- ✅ Error handling

**Backend (NestJS + MongoDB):**
- ✅ REST API with NestJS
- ✅ MongoDB database integration
- ✅ JWT authentication
- ✅ User registration & login
- ✅ Products CRUD operations
- ✅ Password hashing with bcrypt
- ✅ Input validation
- ✅ CORS enabled for Flutter

## 📖 Documentation

**Thai Language Guides:**
- 📱 **[WIDGETS_SUMMARY_TH.md](./WIDGETS_SUMMARY_TH.md)** - สรุป Widgets ที่ใช้ในแอปพลิเคชัน (43 ชนิด) พร้อมคำอธิบายและตัวอย่างโค้ดเป็นภาษาไทย
- 📚 **[LEARNING_GUIDE.md](./LEARNING_GUIDE.md)** - คู่มือเรียนรู้ทีละขั้นตอนเป็นภาษาไทย
- 🔧 **[BACKEND_GUIDE.md](./BACKEND_GUIDE.md)** - คู่มือ Backend Development เป็นภาษาไทย

**English Guides:**
- 🚀 **[QUICKSTART.md](./QUICKSTART.md)** - 5-minute quick start guide
- 📋 **[PROJECT_OVERVIEW.md](./PROJECT_OVERVIEW.md)** - Complete project architecture
- 💪 **[EXERCISES.md](./EXERCISES.md)** - Progressive coding challenges
- 🏗️ **[SOFTWARE_ENGINEERING.md](./SOFTWARE_ENGINEERING.md)** - Software engineering best practices, design patterns, and architecture principles

## 🚀 Getting Started

### Prerequisites

**For Flutter:**
1. **Install Flutter**: Follow the [official Flutter installation guide](https://docs.flutter.dev/get-started/install)
2. **IDE**: VS Code or Android Studio with Flutter plugins
3. **Emulator/Device**: Set up an Android emulator, iOS simulator, or connect a physical device

**For Backend:**
1. **Node.js 18+**: Download from [nodejs.org](https://nodejs.org)
2. **MongoDB**: Install locally or use [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) (free tier)

### Installation

**Flutter App:**
```bash
# Clone this repository
git clone https://github.com/somkheartk/flutter-lab-1-days.git
cd flutter-lab-1-days

# Install dependencies
flutter pub get

# Run the app
flutter run
```

**Backend API:**
```bash
# Navigate to backend directory
cd backend

# Install dependencies
npm install

# Configure environment (copy and edit .env file)
cp .env.example .env

# Seed database with sample data
npm run seed

# Start the server
npm run start:dev
```

The backend will run at `http://localhost:3000/api`

## 📱 Features

### 1. Login Screen
- Email and password validation
- Password visibility toggle
- Loading states
- Error handling
- **Demo credentials**: Use any email (e.g., `demo@test.com`) with password (min 4 characters)

### 2. Home Screen
- Bottom navigation
- User greeting
- Logout functionality
- Navigation between Products and Profile

### 3. Products Screen (E-commerce)
- Fetches real product data from [Fake Store API](https://fakestoreapi.com)
- Grid layout
- Category filters
- Pull-to-refresh
- Loading and error states
- Click to view details

### 4. Product Detail Screen
- Full product information
- Network image loading
- Add to cart (demo)
- Star ratings
- Responsive layout

### 5. Profile/Contact Screen
- User information display
- Profile options
- Contact information
- Settings menu

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── user.dart            # User model
│   └── product.dart         # Product model
├── providers/               # State management
│   ├── auth_provider.dart   # Authentication state
│   └── product_provider.dart # Product state
├── services/                # API and business logic
│   ├── auth_service.dart    # Authentication service
│   └── api_service.dart     # API calls
├── screens/                 # App screens
│   ├── login_screen.dart    # Login UI
│   ├── home_screen.dart     # Main navigation
│   ├── products_screen.dart # Product listing
│   ├── product_detail_screen.dart # Product details
│   └── contact_screen.dart  # Profile/Contact
└── widgets/                 # Reusable widgets
    └── product_card.dart    # Product card component
```

## 📖 Learning Path (1 Day Schedule)

### Morning (4 hours)

#### Hour 1: Basics & Setup
1. Understand Flutter project structure
2. Learn about `pubspec.yaml` and dependencies
3. Explore `main.dart` and app initialization
4. Study the widget tree concept

#### Hour 2: Models & Services
1. Review `models/user.dart` and `models/product.dart`
2. Understand JSON serialization
3. Study `services/auth_service.dart`
4. Learn about async/await and Futures
5. Explore `services/api_service.dart` and HTTP requests

#### Hour 3: State Management
1. Learn about Provider pattern
2. Study `providers/auth_provider.dart`
3. Understand ChangeNotifier
4. Explore `providers/product_provider.dart`
5. Practice notifyListeners()

#### Hour 4: Login Screen
1. Build `screens/login_screen.dart`
2. Learn about StatefulWidget
3. Practice form validation
4. Understand TextEditingController
5. Study navigation (Navigator.push)

### Afternoon (4 hours)

#### Hour 5: Home & Navigation
1. Create `screens/home_screen.dart`
2. Implement BottomNavigationBar
3. Learn screen switching
4. Study Consumer widget
5. Implement logout functionality

#### Hour 6: Products Screen
1. Build `screens/products_screen.dart`
2. Learn GridView.builder
3. Implement API data fetching
4. Handle loading states
5. Add error handling

#### Hour 7: Product Details & Widgets
1. Create `screens/product_detail_screen.dart`
2. Pass data between screens
3. Build `widgets/product_card.dart`
4. Learn reusable components
5. Study Image.network

#### Hour 8: Final Screen & Polish
1. Complete `screens/contact_screen.dart`
2. Add visual polish
3. Test all features
4. Fix any bugs
5. Deploy/Run on device

## 🔑 Key Concepts Covered

### 1. Widgets
- **StatelessWidget**: Immutable widgets (ProductCard, ContactScreen)
- **StatefulWidget**: Mutable widgets with state (LoginScreen, HomeScreen)

### 2. State Management
- **Provider**: Dependency injection and state management
- **ChangeNotifier**: Observable state
- **Consumer**: Listen to state changes

### 3. Navigation
- **Navigator.push**: Go to new screen
- **Navigator.pop**: Go back
- **Navigator.pushReplacement**: Replace current screen

### 4. Async Programming
- **Future**: Represents a value that will be available later
- **async/await**: Syntax for handling asynchronous code
- **HTTP requests**: Network calls to APIs

### 5. Form Handling
- **TextEditingController**: Get text from input fields
- **Form validation**: Validate user input
- **GlobalKey**: Access form state

## 🌐 API Reference

This app uses the [Fake Store API](https://fakestoreapi.com):

- `GET /products` - Get all products
- `GET /products/{id}` - Get single product
- `GET /products/categories` - Get all categories
- `GET /products/category/{category}` - Get products by category

## 🎨 Customization Ideas

Want to extend this project? Try:

1. **Add Shopping Cart**
   - Create cart provider
   - Add/remove items
   - Calculate total

2. **Add Favorites**
   - Implement wishlist
   - Save to local storage
   - Heart icon animation

3. **Search Functionality**
   - Add search bar
   - Filter products
   - Search history

4. **User Registration**
   - Create signup screen
   - Form validation
   - Save user data

5. **Product Categories**
   - Category screen
   - Filter by category
   - Category images

## 📝 Notes

- This is a **learning project** with full-stack capabilities
- Includes **NestJS + MongoDB Backend** for real API integration
- Flutter app can use either the local backend or Fake Store API
- All code is **heavily commented** for learning
- Follow the **1-day schedule** above for best results

## 🔗 Backend API

This project now includes a complete **NestJS + MongoDB backend**!

### Features:
- ✅ User authentication with JWT
- ✅ Product management (CRUD)
- ✅ Category filtering
- ✅ MongoDB database
- ✅ RESTful API design
- ✅ Input validation
- ✅ Password hashing

### Quick Start:
```bash
cd backend
npm install
cp .env.example .env
npm run seed
npm run start:dev
```

### Documentation:
- 📖 **[WIDGETS_SUMMARY_TH.md](./WIDGETS_SUMMARY_TH.md)** - Complete Thai summary of Flutter widgets used (สรุป widgets ที่ใช้ในแอปเป็นภาษาไทย)
- 📖 **[BACKEND_GUIDE.md](./BACKEND_GUIDE.md)** - Complete Thai guide for backend development
- 📖 **[backend/BACKEND_README.md](./backend/BACKEND_README.md)** - Backend API documentation

### API Endpoints:
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `GET /api/products` - Get all products
- `GET /api/products/:id` - Get product by ID
- `GET /api/products/category/:category` - Get products by category

**Demo Credentials:**
- Email: `demo@test.com`
- Password: `password`

## 🐛 Common Issues

### 1. Dependencies Error
```bash
flutter pub get
```

### 2. Gradle Build Error (Android)
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

### 3. iOS Build Error
```bash
cd ios
pod install
cd ..
flutter clean
flutter run
```

## 🤝 Contributing

This is a learning project! Feel free to:
- Report issues
- Suggest improvements
- Add more features
- Improve documentation

## 📄 License

This project is open source and available under the MIT License.

## 👨‍💻 Author

Created for Flutter learners who want to build a complete app in one day!

## 🎓 Next Steps

After completing this lab:
1. Try adding the customization ideas above
2. Learn about more advanced state management (Bloc, Riverpod)
3. Explore Flutter animations
4. Study testing (Unit, Widget, Integration tests)
5. Build your own original app!

---

Happy Learning! 🚀 If you found this helpful, please ⭐ star the repository!