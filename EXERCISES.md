# Exercises and Challenges

Complete these exercises to master Flutter development! 💪

## Level 1: Beginner (1-2 hours)

### Exercise 1.1: Modify UI Colors
**Goal**: Learn to customize themes

**Tasks**:
1. Open `lib/main.dart`
2. Change the `seedColor` from `Colors.blue` to another color
3. Hot reload and see the changes
4. Try at least 3 different colors

**Hint**: Look for `ColorScheme.fromSeed(seedColor: Colors.blue)`

---

### Exercise 1.2: Add a Welcome Message
**Goal**: Learn to modify StatelessWidgets

**Tasks**:
1. Open `lib/screens/login_screen.dart`
2. Add a new `Text` widget below the title with a welcome message
3. Style it with a different color and font size

**Example**:
```dart
Text(
  'Welcome! Please login to continue shopping',
  style: TextStyle(color: Colors.grey),
  textAlign: TextAlign.center,
),
```

---

### Exercise 1.3: Change Product Grid Layout
**Goal**: Learn GridView properties

**Tasks**:
1. Open `lib/screens/products_screen.dart`
2. Change `crossAxisCount` from 2 to 3 (3 columns)
3. Adjust `childAspectRatio` to make it look good
4. Try different spacing values

**Challenge**: Make it 1 column on small screens, 2 on medium, 3 on large

---

## Level 2: Intermediate (3-4 hours)

### Exercise 2.1: Add a Search Bar
**Goal**: Learn about TextFields and filtering

**Tasks**:
1. Add a `TextField` at the top of Products screen
2. Create a search function that filters products by title
3. Update the UI to show filtered results
4. Add a clear button

**Starter Code**:
```dart
TextField(
  decoration: InputDecoration(
    hintText: 'Search products...',
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(),
  ),
  onChanged: (value) {
    // TODO: Filter products
  },
)
```

---

### Exercise 2.2: Implement Favorites
**Goal**: Learn state management with Provider

**Tasks**:
1. Create a new file `lib/providers/favorites_provider.dart`
2. Create a `FavoritesProvider` class with ChangeNotifier
3. Add methods: `addFavorite()`, `removeFavorite()`, `isFavorite()`
4. Add a favorite button to ProductCard
5. Create a favorites screen

**Hint**: Look at `auth_provider.dart` for structure

---

### Exercise 2.3: Shopping Cart
**Goal**: Learn complex state management

**Tasks**:
1. Create `lib/models/cart_item.dart`
2. Create `lib/providers/cart_provider.dart`
3. Implement:
   - Add to cart
   - Remove from cart
   - Update quantity
   - Calculate total
4. Create a cart icon in AppBar showing item count
5. Create a cart screen showing all items

---

## Level 3: Advanced (5+ hours)

### Exercise 3.1: Category Filtering
**Goal**: Learn advanced list operations

**Tasks**:
1. Make the category chips functional in Products screen
2. Filter products when a category is selected
3. Show "All" products when no category is selected
4. Highlight the selected category
5. Show product count for each category

**Bonus**: Add a "Clear filters" button

---

### Exercise 3.2: Product Review System
**Goal**: Learn forms and complex data structures

**Tasks**:
1. Create `lib/models/review.dart`
2. Add a reviews section to Product Detail screen
3. Create a form to submit reviews
4. Store reviews in Provider (or local storage)
5. Display average rating
6. Show review list

**Bonus**: Add review images, helpful votes

---

### Exercise 3.3: User Registration
**Goal**: Learn multi-step forms

**Tasks**:
1. Create `lib/screens/register_screen.dart`
2. Add fields: name, email, password, confirm password
3. Implement validation:
   - Email format
   - Password strength
   - Passwords match
4. Add a "Sign Up" link on login screen
5. Save user data with SharedPreferences

---

### Exercise 3.4: Local Data Persistence
**Goal**: Learn SharedPreferences and local storage

**Tasks**:
1. Save favorites to local storage
2. Save cart items to local storage
3. Restore data when app starts
4. Add clear data button in settings

**Hint**: Use `shared_preferences` package

---

### Exercise 3.5: Add Animations
**Goal**: Learn Flutter animations

**Tasks**:
1. Add a fade-in animation to ProductCard
2. Add a slide animation to screen transitions
3. Add a scale animation to favorite button
4. Animate the cart icon when items are added

**Example**:
```dart
AnimatedContainer(
  duration: Duration(milliseconds: 300),
  curve: Curves.easeInOut,
  // ... properties
)
```

---

## Level 4: Expert (8+ hours)

### Exercise 4.1: Order Management
**Goal**: Build a complete feature

**Tasks**:
1. Create order model
2. Implement checkout flow
3. Create order confirmation screen
4. Build order history screen
5. Add order status tracking

---

### Exercise 4.2: User Profile Management
**Goal**: Complete user experience

**Tasks**:
1. Create profile edit screen
2. Add profile picture (camera/gallery)
3. Add delivery addresses management
4. Add payment methods management
5. Implement preferences

---

### Exercise 4.3: Advanced Search
**Goal**: Complex filtering and sorting

**Tasks**:
1. Add search by multiple fields (title, description, category)
2. Implement price range filter
3. Add rating filter
4. Implement sort options (price, rating, name)
5. Save search history

---

### Exercise 4.4: Multi-language Support
**Goal**: Learn internationalization

**Tasks**:
1. Add `flutter_localizations` dependency
2. Create translation files (English, Thai, etc.)
3. Implement language switcher
4. Translate all strings
5. Save language preference

---

## Bonus Challenges 🏆

### Challenge 1: Offline Mode
- Cache products locally
- Show cached data when offline
- Sync when online

### Challenge 2: Push Notifications
- Add `firebase_messaging`
- Send notifications for deals
- Handle notification taps

### Challenge 3: Social Features
- Share products
- User reviews and ratings
- Product recommendations

### Challenge 4: Analytics
- Add Firebase Analytics
- Track user behavior
- Generate insights

### Challenge 5: Payment Integration
- Integrate payment gateway
- Handle transactions
- Generate receipts

---

## Testing Your Solutions

After each exercise:

1. **Manual Testing**
   - Test happy path
   - Test error cases
   - Test edge cases

2. **Code Quality**
   ```bash
   flutter analyze
   flutter format lib/
   ```

3. **Performance**
   - Check for unnecessary rebuilds
   - Profile with DevTools
   - Optimize if needed

---

## Submission Guidelines

When you complete an exercise:

1. Create a new branch: `exercise-X.X`
2. Make your changes
3. Write a description of what you learned
4. (Optional) Submit a PR to share with others

---

## Learning Resources

- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Provider Package](https://pub.dev/packages/provider)

---

## Need Help?

- 💡 Read the code comments carefully
- 📚 Check the Flutter documentation
- 🔍 Search on Stack Overflow
- 💬 Ask in Flutter communities
- 👨‍💻 Study example code

---

**Remember**: The goal is to learn, not to rush! Take your time and understand each concept. 🚀

Good luck with your exercises! 🎉
