# Contributing to Flutter Lab 1 Days

Thank you for your interest in improving this Flutter learning project! 🎉

## How to Contribute

### For Learners

If you're learning Flutter and want to add features:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/my-new-feature`
3. **Make your changes** with clear comments
4. **Test your changes** thoroughly
5. **Commit your changes**: `git commit -am 'Add some feature'`
6. **Push to the branch**: `git push origin feature/my-new-feature`
7. **Submit a Pull Request**

### What We're Looking For

- 🐛 Bug fixes
- 📚 Documentation improvements
- ✨ New features that help learners
- 🌐 Translations to other languages
- 🎨 UI/UX improvements
- 📝 More code examples

### Feature Ideas

Here are some features learners can implement:

#### Easy (Beginner)
- [ ] Add more product categories
- [ ] Change color theme
- [ ] Add app logo/icon
- [ ] Improve error messages
- [ ] Add loading animations

#### Medium (Intermediate)
- [ ] Implement shopping cart
- [ ] Add favorites/wishlist
- [ ] Implement search functionality
- [ ] Add product filters
- [ ] Create user registration
- [ ] Add dark mode support

#### Hard (Advanced)
- [ ] Implement payment integration
- [ ] Add order history
- [ ] Create admin panel
- [ ] Add push notifications
- [ ] Implement chat support
- [ ] Add analytics

## Code Style

Follow these guidelines:

### Dart/Flutter Conventions
```dart
// Good: Use camelCase for variables
final userName = 'John';

// Good: Use PascalCase for classes
class ProductCard extends StatelessWidget {}

// Good: Add comments for clarity
/// This function fetches products from the API
Future<List<Product>> getProducts() async {}

// Good: Use const when possible
const SizedBox(height: 16)

// Good: Format with dart format
flutter format lib/
```

### File Organization
```
lib/
├── models/          # Data structures
├── providers/       # State management
├── services/        # API & business logic
├── screens/         # Full page screens
├── widgets/         # Reusable components
└── utils/           # Helper functions
```

### Comments
- Write comments in English
- Explain WHY, not WHAT
- Add documentation comments (///) for public APIs
- Include examples in comments for complex code

### Git Commits
```bash
# Good commit messages:
git commit -m "Add shopping cart feature"
git commit -m "Fix login validation bug"
git commit -m "Update README with installation steps"

# Bad commit messages:
git commit -m "Update"
git commit -m "Fix stuff"
git commit -m "asdfasdf"
```

## Testing

Before submitting a PR:

1. **Test on multiple platforms** (if possible)
   ```bash
   flutter test
   flutter run -d android
   flutter run -d ios
   flutter run -d chrome
   ```

2. **Check for linting errors**
   ```bash
   flutter analyze
   ```

3. **Format your code**
   ```bash
   flutter format lib/
   ```

4. **Test edge cases**
   - Empty states
   - Error states
   - Loading states
   - Network failures

## Documentation

When adding features:

1. **Update README.md** if needed
2. **Add comments** to your code
3. **Update LEARNING_GUIDE.md** for major features
4. **Create examples** showing how to use your feature

## Questions?

- 💬 Open an issue for questions
- 📧 Contact the maintainers
- 🌐 Check Flutter docs: https://docs.flutter.dev

## Code of Conduct

- Be respectful and inclusive
- Help other learners
- Focus on education
- Share knowledge
- Have fun! 🚀

## Recognition

All contributors will be listed in the README.md file!

---

Thank you for making this learning resource better! 🙏
