# Flutter Lab - Step by Step Learning Guide

## เรียนรู้ Flutter ภายใน 1 วัน (Thai Guide)

คู่มือนี้จะพาคุณเรียนรู้การสร้างแอป Flutter ตั้งแต่เริ่มต้นจนถึงการทำเว็บ E-commerce แบบครบวงจร

---

## ภาคเช้า: พื้นฐาน Flutter

### ชั่วโมงที่ 1: โครงสร้างโปรเจค (9:00-10:00)

#### 1.1 ทำความเข้าใจไฟล์ `pubspec.yaml`
```yaml
# ไฟล์นี้เหมือนกับ package.json ใน Node.js
# ใช้จัดการ dependencies และ assets

dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0           # สำหรับเรียก API
  provider: ^6.1.1       # สำหรับจัดการ State
  shared_preferences: ^2.2.2  # สำหรับเก็บข้อมูล local
```

**แบบฝึกหัด**: เปิดไฟล์ `pubspec.yaml` และอ่านดูว่ามี dependencies อะไรบ้าง

#### 1.2 ทำความเข้าใจ `main.dart`
```dart
// จุดเริ่มต้นของแอป Flutter ทุกอัน
void main() {
  runApp(const MyApp());  // เริ่มแอป
}
```

**แบบฝึกหัด**: เปิดไฟล์ `lib/main.dart` และอ่าน comments ทั้งหมด

#### 1.3 Widget คืออะไร?
- Widget คือทุกอย่างใน Flutter (Button, Text, Layout, etc.)
- มี 2 ประเภท:
  - **StatelessWidget**: Widget ที่ไม่เปลี่ยนแปลง (ตาย)
  - **StatefulWidget**: Widget ที่เปลี่ยนแปลงได้ (มีชีวิต)

**แบบฝึกหัด**: ลองวาดแผนผัง Widget Tree ของหน้า Login

---

### ชั่วโมงที่ 2: Models และ Services (10:00-11:00)

#### 2.1 Model คืออะไร?
Model เป็นโครงสร้างข้อมูลที่เราใช้ในแอป

**ดูไฟล์**: `lib/models/user.dart`
```dart
class User {
  final String email;
  final String name;
  final String? token;  // ? หมายถึงอาจจะมีหรือไม่มีก็ได้
  
  // Constructor
  User({required this.email, required this.name, this.token});
  
  // แปลงจาก JSON เป็น User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      name: json['name'],
      token: json['token'],
    );
  }
}
```

**แบบฝึกหัด**: 
1. เปิดไฟล์ `lib/models/product.dart`
2. ดูว่า Product มี properties อะไรบ้าง
3. ลองเขียน model ของตัวเอง เช่น `Cart` หรือ `Order`

#### 2.2 Services - การเชื่อมต่อ API

**ดูไฟล์**: `lib/services/api_service.dart`
```dart
// การเรียก API ด้วย HTTP
Future<List<Product>> getProducts() async {
  final response = await http.get(
    Uri.parse('$baseUrl/products'),
  );
  
  if (response.statusCode == 200) {
    // สำเร็จ - แปลง JSON เป็น List<Product>
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => Product.fromJson(json)).toList();
  } else {
    // ไม่สำเร็จ - throw error
    throw Exception('Failed to load products');
  }
}
```

**คำอธิบาย**:
- `async/await`: รอให้ทำงานเสร็จก่อนค่อยทำต่อ
- `Future`: ค่าที่จะได้รับในอนาคต (เหมือน Promise ใน JavaScript)
- `http.get()`: เรียก API แบบ GET

**แบบฝึกหัด**:
1. ลองเรียก API ด้วย Postman: `https://fakestoreapi.com/products`
2. ดูว่า response เป็นอย่างไร

---

### ชั่วโมงที่ 3: State Management ด้วย Provider (11:00-12:00)

#### 3.1 State คืออะไร?
State คือข้อมูลที่เปลี่ยนแปลงได้ในแอป เช่น:
- ผู้ใช้ Login แล้วหรือยัง?
- มีสินค้าอะไรบ้างในตะกร้า?
- กำลัง Loading อยู่หรือเปล่า?

#### 3.2 Provider Pattern

**ดูไฟล์**: `lib/providers/auth_provider.dart`
```dart
class AuthProvider with ChangeNotifier {
  User? _user;              // ข้อมูล User (private)
  bool _isLoading = false;  // สถานะ Loading
  
  // Getter เพื่อเข้าถึงข้อมูล
  User? get user => _user;
  bool get isLoading => _isLoading;
  
  // Method สำหรับ Login
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();  // บอก UI ให้ update
    
    try {
      _user = await _authService.login(email, password);
      _isLoading = false;
      notifyListeners();  // บอก UI อีกครั้ง
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
```

**แนวคิด**:
1. เก็บ state ไว้ใน Provider
2. เมื่อ state เปลี่ยน เรียก `notifyListeners()`
3. UI ที่ใช้ `Consumer` จะ rebuild อัตโนมัติ

**แบบฝึกหัด**:
1. อ่าน `lib/providers/product_provider.dart`
2. ลองเขียน CartProvider ของตัวเอง

---

### ชั่วโมงที่ 4: Login Screen (12:00-13:00)

#### 4.1 Form และ Validation

**ดูไฟล์**: `lib/screens/login_screen.dart`

**Key Concepts**:
```dart
// 1. Form Key สำหรับ validation
final _formKey = GlobalKey<FormState>();

// 2. Controllers สำหรับรับค่าจาก TextField
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

// 3. Validation
TextFormField(
  controller: _emailController,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;  // null = ผ่าน validation
  },
)

// 4. การใช้ Form
if (_formKey.currentState!.validate()) {
  // ทำ login
}
```

**แบบฝึกหัด**:
1. รันแอป: `flutter run`
2. ทดสอบ validation - ใส่ email ผิดดู
3. ลอง Login ด้วย `demo@test.com` / `password`
4. ดู code และแก้ UI ให้สวยขึ้น

---

## ภาคบ่าย: E-commerce Features

### ชั่วโมงที่ 5: Home Screen และ Navigation (13:00-14:00)

#### 5.1 Bottom Navigation Bar

**ดูไฟล์**: `lib/screens/home_screen.dart`
```dart
BottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;  // เปลี่ยนหน้า
    });
  },
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Products'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ],
)
```

#### 5.2 Navigation
```dart
// ไปหน้าใหม่
Navigator.of(context).push(
  MaterialPageRoute(builder: (_) => ProductDetailScreen()),
);

// กลับหน้าเดิม
Navigator.of(context).pop();

// ไปหน้าใหม่แล้วลบหน้าเก่าทิ้ง (ใช้ตอน Login)
Navigator.of(context).pushReplacement(
  MaterialPageRoute(builder: (_) => HomeScreen()),
);
```

**แบบฝึกหัด**:
1. เพิ่ม Tab ใหม่ใน BottomNavigationBar
2. สร้าง Screen ใหม่ (เช่น Cart Screen)
3. ลอง Navigate ไปมา

---

### ชั่วโมงที่ 6: Products Screen (14:00-15:00)

#### 6.1 Loading Data จาก API

**ดูไฟล์**: `lib/screens/products_screen.dart`
```dart
@override
void initState() {
  super.initState();
  // Fetch products เมื่อ screen โหลด
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  });
}
```

#### 6.2 Consumer Widget
```dart
Consumer<ProductProvider>(
  builder: (context, productProvider, child) {
    // UI จะ rebuild เมื่อ productProvider เปลี่ยน
    
    if (productProvider.isLoading) {
      return CircularProgressIndicator();  // แสดง loading
    }
    
    if (productProvider.error != null) {
      return Text('Error: ${productProvider.error}');  // แสดง error
    }
    
    return GridView.builder(...);  // แสดงสินค้า
  },
)
```

#### 6.3 GridView
```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,        // 2 คอลัมน์
    childAspectRatio: 0.7,    // อัตราส่วน width:height
    crossAxisSpacing: 16,     // ระยะห่างแนวนอน
    mainAxisSpacing: 16,      // ระยะห่างแนวตั้ง
  ),
  itemCount: products.length,
  itemBuilder: (context, index) {
    return ProductCard(product: products[index]);
  },
)
```

**แบบฝึกหัด**:
1. เปลี่ยน `crossAxisCount` เป็น 1 หรือ 3
2. เพิ่ม RefreshIndicator (pull-to-refresh)
3. ลองกดสินค้าดู

---

### ชั่วโมงที่ 7: Product Details & Reusable Widgets (15:00-16:00)

#### 7.1 ส่งข้อมูลระหว่างหน้า
```dart
// หน้าต้นทาง
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (_) => ProductDetailScreen(
      product: product,  // ส่งข้อมูลไป
    ),
  ),
);

// หน้าปลายทาง
class ProductDetailScreen extends StatelessWidget {
  final Product product;  // รับข้อมูลมา
  
  const ProductDetailScreen({required this.product});
}
```

#### 7.2 Network Image
```dart
Image.network(
  product.image,
  fit: BoxFit.contain,
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return CircularProgressIndicator();  // แสดงตอน loading
  },
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error);  // แสดงตอน error
  },
)
```

#### 7.3 Reusable Widget

**ดูไฟล์**: `lib/widgets/product_card.dart`
```dart
// Widget ที่สามารถนำไปใช้ซ้ำได้
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  
  const ProductCard({
    required this.product,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(/* ... */),
      ),
    );
  }
}
```

**แบบฝึกหัด**:
1. แก้ UI ของ ProductCard
2. สร้าง Widget ใหม่ เช่น `ReviewCard`, `CategoryCard`
3. ลองทำ Favorite button (ใช้ StatefulWidget)

---

### ชั่วโมงที่ 8: Contact Screen & Final Polish (16:00-17:00)

#### 8.1 Profile Display

**ดูไฟล์**: `lib/screens/contact_screen.dart`
```dart
// แสดงข้อมูล User จาก Provider
final authProvider = Provider.of<AuthProvider>(context);
final user = authProvider.user;

Text(user?.name ?? 'User')  // ?? = ถ้า null ให้ใช้ค่านี้
```

#### 8.2 ListTile
```dart
ListTile(
  leading: Icon(Icons.email),      // ไอคอนด้านซ้าย
  title: Text('Email'),            // หัวข้อ
  subtitle: Text('user@email.com'), // คำอธิบาย
  trailing: Icon(Icons.arrow_forward), // ไอคอนด้านขวา
  onTap: () {/* ... */},           // กดได้
)
```

**แบบฝึกหัด**:
1. เพิ่มข้อมูลติดต่อเพิ่มเติม
2. ทำหน้า Settings
3. เพิ่ม Theme Switcher (Light/Dark mode)

---

## สิ่งที่ควรทำต่อ

### 1. เพิ่ม Shopping Cart
```dart
class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];
  
  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }
  
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
  
  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.price);
  }
}
```

### 2. เพิ่ม Local Storage
```dart
// บันทึก Favorite
final prefs = await SharedPreferences.getInstance();
await prefs.setStringList('favorites', favoriteIds);

// อ่าน Favorite
final favorites = prefs.getStringList('favorites') ?? [];
```

### 3. เพิ่ม Search
```dart
List<Product> searchProducts(String query) {
  return products.where((product) {
    return product.title.toLowerCase().contains(query.toLowerCase());
  }).toList();
}
```

### 4. เพิ่ม Animation
```dart
Hero(
  tag: 'product-${product.id}',
  child: Image.network(product.image),
)
```

---

## Tips สำหรับผู้เรียน

### ✅ Do's
- อ่าน comments ในโค้ดทั้งหมด
- ลองเปลี่ยนค่าต่างๆ ดูว่าเกิดอะไรขึ้น
- ใช้ `print()` เพื่อ debug
- อ่าน error messages อย่างละเอียด
- ค้นหาใน Google เมื่อติดปัญหา

### ❌ Don'ts
- อย่าก็อปวางโค้ดโดยไม่เข้าใจ
- อย่ากลัวที่จะทำผิด
- อย่าข้ามขั้นตอน
- อย่าเพิ่ง dependencies ที่ไม่จำเป็น

---

## คำศัพท์สำคัญ

| คำศัพท์ | ความหมาย |
|---------|----------|
| Widget | องค์ประกอบ UI ใน Flutter |
| State | ข้อมูลที่เปลี่ยนแปลงได้ |
| Provider | ตัวจัดการ State |
| Future | ค่าที่จะได้ในอนาคต (async) |
| async/await | รอให้ทำงานเสร็จ |
| Model | โครงสร้างข้อมูล |
| Service | ตัวจัดการ Logic/API |
| Navigator | ตัวจัดการการเปลี่ยนหน้า |
| BuildContext | ข้อมูล context ของ Widget |
| StatefulWidget | Widget ที่มี State |
| StatelessWidget | Widget ที่ไม่มี State |

---

## Resources เพิ่มเติม

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)
- [Pub.dev](https://pub.dev/) - Flutter Packages
- [Flutter Community](https://flutter.dev/community)

---

**สนุกกับการเขียน Flutter! 🎉**

หากมีคำถาม สามารถเปิด Issue ใน GitHub ได้เลย