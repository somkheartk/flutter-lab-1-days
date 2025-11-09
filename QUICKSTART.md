# Quick Start Guide

## ⚡ Get Started in 5 Minutes

### Step 1: Prerequisites
Make sure you have Flutter installed:
```bash
flutter doctor
```

### Step 2: Get Dependencies
```bash
flutter pub get
```

### Step 3: Run the App
```bash
# On connected device or emulator
flutter run

# On Chrome (web)
flutter run -d chrome

# On specific device
flutter devices  # List devices
flutter run -d <device-id>
```

### Step 4: Login
Use these demo credentials:
- Email: `demo@test.com`
- Password: `password` (or any password with 4+ characters)

## 🎯 What to Try

### Beginner Tasks (30 minutes)
1. ✅ Login with demo credentials
2. ✅ Browse the product catalog
3. ✅ Click on a product to see details
4. ✅ Navigate to Profile tab
5. ✅ Try the logout function

### Intermediate Tasks (2-3 hours)
1. 📝 Change the app theme colors in `main.dart`
2. 📝 Add a new field to the login form
3. 📝 Modify the ProductCard widget layout
4. 📝 Add a search feature to products screen
5. 📝 Create a favorites/wishlist feature

### Advanced Tasks (4+ hours)
1. 🚀 Implement a shopping cart with Provider
2. 🚀 Add local storage for favorites
3. 🚀 Create category filtering
4. 🚀 Add product search functionality
5. 🚀 Implement checkout flow

## 📱 Supported Platforms

- ✅ Android (API 21+)
- ✅ iOS (iOS 12+)
- ✅ Web
- ✅ macOS
- ✅ Windows
- ✅ Linux

## 🐛 Troubleshooting

### Problem: Dependencies not found
```bash
flutter clean
flutter pub get
```

### Problem: Build errors on Android
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter run
```

### Problem: iOS build errors
```bash
cd ios
pod deintegrate
pod install
cd ..
flutter clean
flutter run
```

### Problem: Network errors
- Make sure you have internet connection
- The app uses https://fakestoreapi.com
- Try in browser: https://fakestoreapi.com/products

## 📚 Learning Resources

1. **README.md** - Overview and features
2. **LEARNING_GUIDE.md** - Step-by-step Thai guide
3. **Code Comments** - Every file has detailed explanations
4. **Flutter Docs** - https://docs.flutter.dev

## 🎓 Recommended Learning Order

1. Read `lib/main.dart` - Understand app structure
2. Read `lib/models/` - Understand data models
3. Read `lib/services/` - Understand API calls
4. Read `lib/providers/` - Understand state management
5. Read `lib/screens/login_screen.dart` - Forms and validation
6. Read `lib/screens/products_screen.dart` - Lists and APIs
7. Read `lib/widgets/product_card.dart` - Reusable widgets
8. Experiment and build your own features!

## 💡 Pro Tips

- Use `print()` for debugging
- Use `debugPrint()` for longer messages
- Hot reload with `r` in terminal (or save in IDE)
- Hot restart with `R` in terminal
- Read error messages carefully - they're helpful!

## 🤝 Need Help?

- Check the [Flutter documentation](https://docs.flutter.dev)
- Search on [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)
- Join [Flutter Community](https://flutter.dev/community)
- Open an issue in this repository

---

**Happy Coding! 🚀**
