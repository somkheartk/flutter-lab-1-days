# สรุป Widgets ที่ใช้ในแอปพลิเคชัน Flutter

## 📚 สารบัญ
1. [Widget พื้นฐาน](#widget-พื้นฐาน)
2. [Layout Widgets](#layout-widgets)
3. [Navigation Widgets](#navigation-widgets)
4. [Form Widgets](#form-widgets)
5. [List และ Grid Widgets](#list-และ-grid-widgets)
6. [State Management Widgets](#state-management-widgets)
7. [Display Widgets](#display-widgets)
8. [Interactive Widgets](#interactive-widgets)
9. [Styling Widgets](#styling-widgets)
10. [สรุปตามหน้าจอ](#สรุปตามหน้าจอ)

---

## Widget พื้นฐาน

### 1. **StatelessWidget**
- **ไฟล์:** `lib/widgets/product_card.dart`, `lib/screens/products_screen.dart`, `lib/screens/contact_screen.dart`, `lib/screens/product_detail_screen.dart`
- **คำอธิบาย:** Widget ที่ไม่มีสถานะเปลี่ยนแปลง เหมาะสำหรับการแสดงผลข้อมูลที่คงที่
- **การใช้งาน:** ใช้สำหรับ component ที่ไม่ต้องการ rebuild เมื่อมีการเปลี่ยนแปลงภายใน

**ตัวอย่าง:**
```dart
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(...);
  }
}
```

### 2. **StatefulWidget**
- **ไฟล์:** `lib/screens/login_screen.dart`, `lib/screens/home_screen.dart`
- **คำอธิบาย:** Widget ที่มีสถานะที่สามารถเปลี่ยนแปลงได้ ใช้ `setState()` เพื่ออัพเดต UI
- **การใช้งาน:** ใช้สำหรับหน้าจอที่มีการโต้ตอบและต้องการอัพเดต UI

**ตัวอย่าง:**
```dart
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

---

## Layout Widgets

### 3. **Scaffold**
- **ไฟล์:** ใช้ในทุกหน้าจอ
- **คำอธิบาย:** โครงสร้างพื้นฐานของหน้าจอ ประกอบด้วย AppBar, Body, BottomNavigationBar
- **คุณสมบัติหลัก:**
  - `appBar`: แถบด้านบน
  - `body`: เนื้อหาหลัก
  - `bottomNavigationBar`: แถบนำทางด้านล่าง

**ตัวอย่าง:**
```dart
Scaffold(
  appBar: AppBar(title: const Text('Flutter Shop')),
  body: Center(child: Text('Content')),
  bottomNavigationBar: BottomNavigationBar(...),
)
```

### 4. **AppBar**
- **ไฟล์:** `lib/screens/home_screen.dart`, `lib/screens/product_detail_screen.dart`
- **คำอธิบาย:** แถบด้านบนของหน้าจอ แสดงชื่อหน้าและปุ่มควบคุม
- **คุณสมบัติหลัก:**
  - `title`: ชื่อหน้าจอ
  - `actions`: ปุ่มทางด้านขวา
  - `centerTitle`: จัดชื่อกลาง

**ตัวอย่าง:**
```dart
AppBar(
  title: const Text('Flutter Shop'),
  actions: [
    IconButton(
      icon: const Icon(Icons.logout),
      onPressed: _handleLogout,
    ),
  ],
)
```

### 5. **Column**
- **ไฟล์:** ใช้ในทุกหน้าจอ
- **คำอธิบาย:** จัดเรียง widgets ในแนวตั้ง
- **คุณสมบัติหลัก:**
  - `children`: รายการ widgets
  - `mainAxisAlignment`: การจัดวางในแนวหลัก
  - `crossAxisAlignment`: การจัดวางในแนวขวาง

**ตัวอย่าง:**
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Icon(Icons.shopping_bag, size: 100),
    const SizedBox(height: 24),
    Text('Welcome to Flutter Shop'),
  ],
)
```

### 6. **Row**
- **ไฟล์:** `lib/screens/product_detail_screen.dart`, `lib/screens/contact_screen.dart`
- **คำอธิบาย:** จัดเรียง widgets ในแนวนอน
- **การใช้งาน:** แสดงคะแนนดาว, ไอคอนพร้อมข้อความ

**ตัวอย่าง:**
```dart
Row(
  children: [
    const Icon(Icons.star, color: Colors.amber, size: 20),
    const SizedBox(width: 4),
    Text('${product.rating.rate}'),
  ],
)
```

### 7. **Container**
- **ไฟล์:** ใช้ในทุกหน้าจอ
- **คำอธิบาย:** Widget สำหรับกำหนดขนาด, padding, margin, และสไตล์
- **คุณสมบัติหลัก:**
  - `width`, `height`: ขนาด
  - `padding`: ระยะห่างภายใน
  - `decoration`: การตزกแต่ง (สี, ขอบ, เงา)
  - `child`: widget ด้านใน

**ตัวอย่าง:**
```dart
Container(
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: Colors.blue.shade50,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text('Demo credentials'),
)
```

### 8. **SizedBox**
- **ไฟล์:** ใช้ในทุกหน้าจอ
- **คำอธิบาย:** กำหนดขนาดคงที่หรือสร้างช่องว่าง
- **การใช้งาน:** สร้างระยะห่างระหว่าง widgets

**ตัวอย่าง:**
```dart
const SizedBox(height: 24)  // ช่องว่างแนวตั้ง
const SizedBox(width: 16)   // ช่องว่างแนวนอน
```

### 9. **Padding**
- **ไฟล์:** ใช้ในทุกหน้าจอ
- **คำอธิบาย:** เพิ่มระยะห่างรอบ widget
- **คุณสมบัติหลัก:**
  - `padding`: กำหนดระยะห่าง (EdgeInsets)

**ตัวอย่าง:**
```dart
Padding(
  padding: const EdgeInsets.all(16.0),
  child: Text('Content with padding'),
)
```

### 10. **Center**
- **ไฟล์:** `lib/screens/login_screen.dart`, `lib/screens/products_screen.dart`
- **คำอธิบาย:** จัด widget ให้อยู่ตรงกลาง
- **การใช้งาน:** จัดตำแหน่ง loading indicator, error message

**ตัวอย่าง:**
```dart
Center(
  child: CircularProgressIndicator(),
)
```

### 11. **Expanded**
- **ไฟล์:** `lib/screens/products_screen.dart`, `lib/widgets/product_card.dart`
- **คำอธิบาย:** ขยาย widget ให้เต็มพื้นที่ที่เหลือ
- **การใช้งาน:** ใช้ใน Column หรือ Row

**ตัวอย่าง:**
```dart
Column(
  children: [
    Text('Header'),
    Expanded(
      child: GridView.builder(...),  // เต็มพื้นที่ที่เหลือ
    ),
  ],
)
```

### 12. **SingleChildScrollView**
- **ไฟล์:** `lib/screens/login_screen.dart`, `lib/screens/product_detail_screen.dart`, `lib/screens/contact_screen.dart`
- **คำอธิบาย:** ทำให้เนื้อหาเลื่อนได้เมื่อเกินหน้าจอ
- **การใช้งาน:** ป้องกันการ overflow

**ตัวอย่าง:**
```dart
SingleChildScrollView(
  padding: const EdgeInsets.all(24.0),
  child: Column(
    children: [
      // เนื้อหาที่อาจยาวเกินหน้าจอ
    ],
  ),
)
```

### 13. **SafeArea**
- **ไฟล์:** `lib/screens/login_screen.dart`
- **คำอธิบาย:** ป้องกันเนื้อหาทับกับ system UI (notch, status bar)
- **การใช้งาน:** ห่อเนื้อหาหลักของหน้าจอ

**ตัวอย่าง:**
```dart
Scaffold(
  body: SafeArea(
    child: Center(child: Text('Content')),
  ),
)
```

---

## Navigation Widgets

### 14. **BottomNavigationBar**
- **ไฟล์:** `lib/screens/home_screen.dart`
- **คำอธิบาย:** แถบนำทางด้านล่างสำหรับสลับระหว่างหน้าหลัก
- **คุณสมบัติหลัก:**
  - `currentIndex`: หน้าที่เลือกอยู่
  - `onTap`: ฟังก์ชันเมื่อกดเลือก
  - `items`: รายการเมนู

**ตัวอย่าง:**
```dart
BottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag),
      label: 'Products',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
)
```

### 15. **Navigator**
- **ไฟล์:** ใช้ในทุกหน้าจอที่มีการนำทาง
- **คำอธิบาย:** จัดการการเปลี่ยนหน้าจอ
- **เมธอดหลัก:**
  - `push`: ไปหน้าใหม่
  - `pop`: กลับหน้าก่อน
  - `pushReplacement`: แทนที่หน้าปัจจุบัน
  - `pushAndRemoveUntil`: ลบประวัติและไปหน้าใหม่

**ตัวอย่าง:**
```dart
// ไปหน้าใหม่
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (_) => ProductDetailScreen(product: product),
  ),
);

// แทนที่หน้าปัจจุบัน (หลังจาก login)
Navigator.of(context).pushReplacement(
  MaterialPageRoute(builder: (_) => const HomeScreen()),
);

// ลบประวัติทั้งหมด (logout)
Navigator.of(context).pushAndRemoveUntil(
  MaterialPageRoute(builder: (_) => const LoginScreen()),
  (route) => false,
);
```

---

## Form Widgets

### 16. **Form**
- **ไฟล์:** `lib/screens/login_screen.dart`
- **คำอธิบาย:** ห่อ form fields และจัดการ validation
- **คุณสมบัติหลัก:**
  - `key`: GlobalKey สำหรับเข้าถึง form state

**ตัวอย่าง:**
```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(...),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // ทำงานเมื่อ validation ผ่าน
          }
        },
        child: Text('Submit'),
      ),
    ],
  ),
)
```

### 17. **TextFormField**
- **ไฟล์:** `lib/screens/login_screen.dart`
- **คำอธิบาย:** ช่องกรอกข้อความที่มี validation
- **คุณสมบัติหลัก:**
  - `controller`: TextEditingController สำหรับดึงค่า
  - `decoration`: InputDecoration สำหรับตกแต่ง
  - `validator`: ฟังก์ชัน validation
  - `obscureText`: ซ่อนข้อความ (สำหรับรหัสผ่าน)
  - `keyboardType`: ประเภทแป้นพิมพ์

**ตัวอย่าง:**
```dart
final _emailController = TextEditingController();

TextFormField(
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
  decoration: const InputDecoration(
    labelText: 'Email',
    hintText: 'Enter your email',
    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  },
)
```

### 18. **ElevatedButton**
- **ไฟล์:** ใช้ในทุกหน้าจอ
- **คำอธิบาย:** ปุ่มที่มีเงาและการยกระดับ
- **คุณสมบัติหลัก:**
  - `onPressed`: ฟังก์ชันเมื่อกด (null = disable)
  - `child`: เนื้อหาในปุ่ม
  - `style`: ปรับแต่งสไตล์

**ตัวอย่าง:**
```dart
ElevatedButton(
  onPressed: isLoading ? null : _handleLogin,
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: const Text('Login'),
)

// ปุ่มที่มีไอคอน
ElevatedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.shopping_cart),
  label: const Text('Add to Cart'),
)
```

### 19. **IconButton**
- **ไฟล์:** `lib/screens/login_screen.dart`, `lib/screens/home_screen.dart`
- **คำอธิบาย:** ปุ่มที่เป็นไอคอน
- **การใช้งาน:** ปุ่ม logout, toggle password visibility

**ตัวอย่าง:**
```dart
IconButton(
  icon: Icon(
    _obscurePassword ? Icons.visibility : Icons.visibility_off,
  ),
  onPressed: () {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  },
)
```

### 20. **TextButton**
- **ไฟล์:** `lib/screens/home_screen.dart`
- **คำอธิบาย:** ปุ่มข้อความแบบเรียบ
- **การใช้งาน:** ปุ่มใน Dialog

**ตัวอย่าง:**
```dart
TextButton(
  onPressed: () => Navigator.pop(context),
  child: const Text('Cancel'),
)
```

---

## List และ Grid Widgets

### 21. **ListView**
- **ไฟล์:** `lib/screens/products_screen.dart`
- **คำอธิบาย:** แสดงรายการแนวนอนหรือแนวตั้ง
- **การใช้งาน:** แสดง category filters แนวนอน

**ตัวอย่าง:**
```dart
ListView(
  scrollDirection: Axis.horizontal,
  padding: const EdgeInsets.symmetric(horizontal: 16),
  children: [
    _CategoryChip(label: 'All', isSelected: true),
    _CategoryChip(label: 'Electronics', isSelected: false),
  ],
)
```

### 22. **GridView.builder**
- **ไฟล์:** `lib/screens/products_screen.dart`
- **คำอธิบาย:** แสดงรายการในรูปแบบตาราง (grid)
- **คุณสมบัติหลัก:**
  - `gridDelegate`: กำหนดจำนวนคอลัมน์และระยะห่าง
  - `itemCount`: จำนวนรายการ
  - `itemBuilder`: สร้าง widget สำหรับแต่ละรายการ

**ตัวอย่าง:**
```dart
GridView.builder(
  padding: const EdgeInsets.all(16),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,           // 2 คอลัมน์
    childAspectRatio: 0.7,       // สัดส่วน width:height
    crossAxisSpacing: 16,        // ระยะห่างแนวนอน
    mainAxisSpacing: 16,         // ระยะห่างแนวตั้ง
  ),
  itemCount: products.length,
  itemBuilder: (context, index) {
    final product = products[index];
    return ProductCard(product: product, onTap: () {});
  },
)
```

### 23. **ListTile**
- **ไฟล์:** `lib/screens/contact_screen.dart`
- **คำอธิบาย:** แสดงรายการที่มี leading icon, title, subtitle
- **คุณสมบัติหลัก:**
  - `leading`: widget ด้านหน้า
  - `title`: หัวข้อหลัก
  - `subtitle`: หัวข้อรอง
  - `trailing`: widget ด้านหลัง
  - `onTap`: ฟังก์ชันเมื่อกด

**ตัวอย่าง:**
```dart
ListTile(
  leading: Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(Icons.person),
  ),
  title: Text('Edit Profile'),
  subtitle: Text('Update your personal information'),
  trailing: const Icon(Icons.chevron_right),
  onTap: () {},
)
```

---

## State Management Widgets

### 24. **Provider (MultiProvider)**
- **ไฟล์:** `lib/main.dart`
- **คำอธิบาย:** จัดการ state ในระดับ app
- **การใช้งาน:** ห่อ MaterialApp เพื่อให้ทุกหน้าเข้าถึง providers

**ตัวอย่าง:**
```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
  ],
  child: MaterialApp(...),
)
```

### 25. **Consumer**
- **ไฟล์:** `lib/screens/login_screen.dart`, `lib/screens/products_screen.dart`
- **คำอธิบาย:** ฟัง state changes และ rebuild เมื่อ state เปลี่ยน
- **การใช้งาน:** อ่านค่าจาก provider และอัพเดต UI

**ตัวอย่าง:**
```dart
Consumer<AuthProvider>(
  builder: (context, authProvider, child) {
    return ElevatedButton(
      onPressed: authProvider.isLoading ? null : _handleLogin,
      child: authProvider.isLoading
          ? CircularProgressIndicator()
          : Text('Login'),
    );
  },
)
```

### 26. **ChangeNotifier & ChangeNotifierProvider**
- **ไฟล์:** `lib/providers/auth_provider.dart`, `lib/providers/product_provider.dart`
- **คำอธิบาย:** คลาสสำหรับจัดการ state และแจ้ง listeners เมื่อมีการเปลี่ยนแปลง
- **การใช้งาน:** extend ChangeNotifier และเรียก notifyListeners()

**ตัวอย่าง:**
```dart
class AuthProvider extends ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  User? get user => _user;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();  // บอก UI ให้ rebuild
    
    // login logic...
    
    _isLoading = false;
    notifyListeners();
    return success;
  }
}
```

---

## Display Widgets

### 27. **Text**
- **ไฟล์:** ใช้ในทุกหน้าจอ
- **คำอธิบาย:** แสดงข้อความ
- **คุณสมบัติหลัก:**
  - `style`: TextStyle สำหรับกำหนดสไตล์
  - `textAlign`: จัดวางข้อความ
  - `maxLines`: จำนวนบรรทัดสูงสุด
  - `overflow`: จัดการข้อความที่ยาวเกิน

**ตัวอย่าง:**
```dart
Text(
  'Welcome to Flutter Shop',
  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
    fontWeight: FontWeight.bold,
  ),
  textAlign: TextAlign.center,
)

Text(
  product.title,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,  // แสดง ... เมื่อยาวเกิน
)
```

### 28. **Icon**
- **ไฟล์:** ใช้ในทุกหน้าจอ
- **คำอธิบาย:** แสดงไอคอนจาก Material Icons
- **คุณสมบัติหลัก:**
  - `size`: ขนาด
  - `color`: สี

**ตัวอย่าง:**
```dart
Icon(
  Icons.shopping_bag,
  size: 100,
  color: Theme.of(context).colorScheme.primary,
)

const Icon(Icons.star, color: Colors.amber, size: 20)
```

### 29. **Image.network**
- **ไฟล์:** `lib/widgets/product_card.dart`, `lib/screens/product_detail_screen.dart`
- **คำอธิบาย:** โหลดและแสดงรูปภาพจาก URL
- **คุณสมบัติหลัก:**
  - `fit`: BoxFit กำหนดวิธีแสดงรูป
  - `loadingBuilder`: แสดง loading indicator
  - `errorBuilder`: แสดงเมื่อโหลดรูปไม่สำเร็จ

**ตัวอย่าง:**
```dart
Image.network(
  product.image,
  fit: BoxFit.contain,
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  },
  errorBuilder: (context, error, stackTrace) {
    return const Center(
      child: Icon(Icons.error, size: 64),
    );
  },
)
```

### 30. **CircularProgressIndicator**
- **ไฟล์:** `lib/screens/login_screen.dart`, `lib/screens/products_screen.dart`
- **คำอธิบาย:** แสดง loading indicator แบบวงกลม
- **คุณสมบัติหลัก:**
  - `value`: ความคืบหน้า (null = แบบไม่จำกัด)
  - `strokeWidth`: ความหนาของเส้น

**ตัวอย่าง:**
```dart
// Loading แบบไม่จำกัด
const CircularProgressIndicator()

// Loading แบบมีความคืบหน้า
CircularProgressIndicator(
  value: 0.7,  // 70%
  strokeWidth: 2,
)
```

### 31. **CircleAvatar**
- **ไฟล์:** `lib/screens/contact_screen.dart`
- **คำอธิบาย:** แสดงรูปโปรไฟล์แบบวงกลม
- **คุณสมบัติหลัก:**
  - `radius`: รัศมี
  - `backgroundColor`: สีพื้นหลัง
  - `child`: widget ด้านใน

**ตัวอย่าง:**
```dart
CircleAvatar(
  radius: 50,
  backgroundColor: Colors.white,
  child: Text(
    user?.name.substring(0, 1).toUpperCase() ?? 'U',
    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
  ),
)
```

### 32. **Divider**
- **ไฟล์:** `lib/screens/contact_screen.dart`
- **คำอธิบาย:** เส้นแบ่งแนวนอน
- **คุณสมบัติหลัก:**
  - `height`: ความสูงรวม padding
  - `thickness`: ความหนาของเส้น
  - `color`: สี

**ตัวอย่าง:**
```dart
const Divider(height: 32)
```

---

## Interactive Widgets

### 33. **InkWell**
- **ไฟล์:** `lib/widgets/product_card.dart`
- **คำอธิบาย:** เพิ่มการตอบสนองเมื่อกด (ripple effect)
- **คุณสมบัติหลัก:**
  - `onTap`: ฟังก์ชันเมื่อกด
  - `child`: widget ด้านใน

**ตัวอย่าง:**
```dart
InkWell(
  onTap: () {
    Navigator.push(...);
  },
  child: Column(...),
)
```

### 34. **Card**
- **ไฟล์:** `lib/widgets/product_card.dart`
- **คำอธิบาย:** กล่องที่มีเงาและมุมโค้ง
- **คุณสมบัติหลัก:**
  - `elevation`: ความสูงของเงา
  - `clipBehavior`: จัดการการ clip ของ child
  - `child`: widget ด้านใน

**ตัวอย่าง:**
```dart
Card(
  elevation: 2,
  clipBehavior: Clip.antiAlias,
  child: InkWell(
    onTap: onTap,
    child: Column(...),
  ),
)
```

### 35. **FilterChip**
- **ไฟล์:** `lib/screens/products_screen.dart`
- **คำอธิบาย:** Chip สำหรับกรองข้อมูล
- **คุณสมบัติหลัก:**
  - `label`: ข้อความแสดง
  - `selected`: สถานะเลือก
  - `onSelected`: ฟังก์ชันเมื่อเลือก

**ตัวอย่าง:**
```dart
FilterChip(
  label: Text('Electronics'),
  selected: isSelected,
  onSelected: (bool selected) {
    // จัดการ filter
  },
)
```

### 36. **RefreshIndicator**
- **ไฟล์:** `lib/screens/products_screen.dart`
- **คำอธิบาย:** เพิ่มฟีเจอร์ pull-to-refresh
- **คุณสมบัติหลัก:**
  - `onRefresh`: ฟังก์ชันเมื่อ pull refresh
  - `child`: widget ที่ต้องการทำให้ refresh ได้

**ตัวอย่าง:**
```dart
RefreshIndicator(
  onRefresh: () => productProvider.fetchProducts(),
  child: GridView.builder(...),
)
```

### 37. **AlertDialog**
- **ไฟล์:** `lib/screens/home_screen.dart`
- **คำอธิบาย:** กล่องข้อความแจ้งเตือน
- **คุณสมบัติหลัก:**
  - `title`: หัวข้อ
  - `content`: เนื้อหา
  - `actions`: ปุ่มต่างๆ

**ตัวอย่าง:**
```dart
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('Logout'),
    content: const Text('Are you sure you want to logout?'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () {
          // logout logic
        },
        child: const Text('Logout'),
      ),
    ],
  ),
)
```

### 38. **SnackBar**
- **ไฟล์:** `lib/screens/login_screen.dart`, `lib/screens/product_detail_screen.dart`, `lib/screens/contact_screen.dart`
- **คำอธิบาย:** ข้อความแจ้งเตือนแบบชั่วคราวด้านล่าง
- **คุณสมบัติหลัก:**
  - `content`: เนื้อหา
  - `backgroundColor`: สีพื้นหลัง
  - `duration`: ระยะเวลาแสดง

**ตัวอย่าง:**
```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Login failed'),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 2),
  ),
)
```

---

## Styling Widgets

### 39. **Theme**
- **ไฟล์:** ใช้ในทุกหน้าจอ
- **คำอธิบาย:** เข้าถึง theme ของแอป
- **การใช้งาน:** ใช้สีและสไตล์ที่สอดคล้องกันทั้งแอป

**ตัวอย่าง:**
```dart
Theme.of(context).colorScheme.primary
Theme.of(context).textTheme.headlineMedium
```

### 40. **MaterialApp**
- **ไฟล์:** `lib/main.dart`
- **คำอธิบาย:** Widget หลักของแอป กำหนด theme และ navigation
- **คุณสมบัติหลัก:**
  - `title`: ชื่อแอป
  - `theme`: ThemeData
  - `home`: หน้าแรก
  - `debugShowCheckedModeBanner`: แสดง debug banner

**ตัวอย่าง:**
```dart
MaterialApp(
  title: 'Flutter Lab 1 Days',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  ),
  home: const LoginScreen(),
)
```

### 41. **BoxDecoration**
- **ไฟล์:** `lib/screens/login_screen.dart`, `lib/screens/contact_screen.dart`
- **คำอธิบาย:** ตกแต่ง Container ด้วยสี, ขอบ, เงา, gradient
- **คุณสมบัติหลัก:**
  - `color`: สีพื้นหลัง
  - `borderRadius`: มุมโค้ง
  - `gradient`: ไล่สี
  - `boxShadow`: เงา

**ตัวอย่าง:**
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.blue.shade50,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text('Styled container'),
)
```

### 42. **LinearGradient**
- **ไฟล์:** `lib/screens/contact_screen.dart`
- **คำอธิบาย:** สร้างการไล่สีแบบเส้นตรง
- **คุณสมบัติหลัก:**
  - `begin`: จุดเริ่มต้น
  - `end`: จุดสิ้นสุด
  - `colors`: รายการสี

**ตัวอย่าง:**
```dart
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.secondary,
      ],
    ),
  ),
)
```

### 43. **BorderRadius**
- **ไฟล์:** ใช้ในหลายไฟล์
- **คำอธิบาย:** กำหนดมุมโค้ง
- **การใช้งาน:** ใช้ใน BoxDecoration, RoundedRectangleBorder

**ตัวอย่าง:**
```dart
BorderRadius.circular(8)      // มุมโค้งทุกมุม
BorderRadius.circular(20)     // มุมโค้งมากขึ้น
```

---

## สรุปตามหน้าจอ

### 📱 LoginScreen (lib/screens/login_screen.dart)
**Widgets ที่ใช้:**
1. **StatefulWidget** - เพื่อจัดการ state (password visibility, loading)
2. **Scaffold** - โครงสร้างหน้าจอ
3. **SafeArea** - ป้องกันทับ system UI
4. **Center** - จัดเนื้อหาตรงกลาง
5. **SingleChildScrollView** - ทำให้เลื่อนได้
6. **Form** - จัดการ form validation
7. **Column** - จัดเรียงในแนวตั้ง
8. **Icon** - แสดงไอคอนแอป (shopping_bag)
9. **Text** - แสดงข้อความต่างๆ
10. **SizedBox** - สร้างช่องว่าง
11. **TextFormField** (2 ช่อง) - email และ password
12. **IconButton** - toggle password visibility
13. **Consumer<AuthProvider>** - ฟัง auth state
14. **ElevatedButton** - ปุ่ม login
15. **CircularProgressIndicator** - แสดง loading
16. **Container** - กล่องสำหรับ demo credentials
17. **BoxDecoration** - ตกแต่งกล่อง
18. **Provider.of** - เข้าถึง AuthProvider
19. **Navigator** - นำทางไปหน้า HomeScreen
20. **ScaffoldMessenger** - แสดง SnackBar

**จุดเด่น:**
- Form validation ที่ครบถ้วน
- Password visibility toggle
- Loading state management
- Error handling

---

### 🏠 HomeScreen (lib/screens/home_screen.dart)
**Widgets ที่ใช้:**
1. **StatefulWidget** - จัดการ navigation index
2. **Scaffold** - โครงสร้างหน้าจอ
3. **AppBar** - แถบด้านบนพร้อม title และ actions
4. **Text** - แสดงชื่อผู้ใช้
5. **IconButton** - ปุ่ม logout
6. **BottomNavigationBar** - แถบนำทางด้านล่าง (Products, Profile)
7. **Provider.of** - เข้าถึง AuthProvider และ ProductProvider
8. **AlertDialog** - ยืนยันการ logout
9. **TextButton** - ปุ่มใน dialog
10. **Navigator** - จัดการการนำทาง

**จุดเด่น:**
- Bottom navigation สำหรับสลับหน้า
- แสดงชื่อผู้ใช้จาก provider
- Logout confirmation dialog
- Fetch products เมื่อโหลดหน้า

---

### 🛍️ ProductsScreen (lib/screens/products_screen.dart)
**Widgets ที่ใช้:**
1. **StatelessWidget** - ไม่ต้องจัดการ state เอง
2. **Consumer<ProductProvider>** - ฟัง product state
3. **Center** - จัดตำแหน่งกลาง
4. **CircularProgressIndicator** - แสดง loading
5. **Column** - จัดเรียงในแนวตั้ง
6. **Icon** - แสดงไอคอน error
7. **Text** - แสดงข้อความ error
8. **ElevatedButton** - ปุ่ม retry
9. **RefreshIndicator** - pull-to-refresh
10. **Container** - กล่องสำหรับ category filter
11. **ListView** - แสดง category chips แนวนอน
12. **FilterChip** - ปุ่มกรองหมวดหมู่
13. **Expanded** - ขยายพื้นที่สำหรับ GridView
14. **GridView.builder** - แสดง products เป็น grid
15. **SliverGridDelegateWithFixedCrossAxisCount** - กำหนด layout grid
16. **ProductCard** - custom widget
17. **Navigator** - ไปหน้า ProductDetailScreen

**จุดเด่น:**
- Loading, error และ empty states
- Pull-to-refresh
- Category filters (แนวนอน)
- Grid layout แบบ 2 คอลัมน์
- Navigation ไปยังหน้ารายละเอียด

---

### 📦 ProductDetailScreen (lib/screens/product_detail_screen.dart)
**Widgets ที่ใช้:**
1. **StatelessWidget** - รับ product เป็น parameter
2. **Scaffold** - โครงสร้างหน้าจอ
3. **AppBar** - แถบด้านบน
4. **SingleChildScrollView** - ทำให้เลื่อนได้
5. **Column** - จัดเรียงในแนวตั้ง
6. **Container** - กล่องสำหรับรูปและ category badge
7. **Image.network** - แสดงรูปสินค้า
8. **CircularProgressIndicator** - loading รูป
9. **Padding** - เพิ่มระยะห่าง
10. **BoxDecoration** - ตกแต่ง category badge
11. **BorderRadius** - มุมโค้ง
12. **Text** - แสดงข้อมูลสินค้า (title, price, description)
13. **Row** - แสดง rating แนวนอน
14. **Icon** - ดาว rating
15. **SizedBox** - ช่องว่าง
16. **ElevatedButton.icon** - ปุ่ม Add to Cart
17. **ScaffoldMessenger** - แสดง SnackBar
18. **Theme.of** - เข้าถึง theme

**จุดเด่น:**
- รูปภาพใหญ่พร้อม loading state
- Category badge
- Rating display
- รายละเอียดสินค้าครบถ้วน
- ปุ่ม Add to Cart (demo)

---

### 👤 ContactScreen (lib/screens/contact_screen.dart)
**Widgets ที่ใช้:**
1. **StatelessWidget** - แสดงข้อมูล profile
2. **Provider.of** - เข้าถึง AuthProvider
3. **SingleChildScrollView** - ทำให้เลื่อนได้
4. **Column** - จัดเรียงในแนวตั้ง
5. **Container** - กล่อง header พร้อม gradient
6. **BoxDecoration** - ตกแต่งด้วย gradient
7. **LinearGradient** - ไล่สีพื้นหลัง
8. **CircleAvatar** - รูปโปรไฟล์แบบวงกลม
9. **Text** - แสดงชื่อและอีเมล
10. **ListTile** - รายการ profile options
11. **Icon** - ไอคอนต่างๆ
12. **Divider** - เส้นแบ่ง
13. **Padding** - เพิ่มระยะห่าง
14. **Row** - จัดวางไอคอนและข้อความ
15. **Expanded** - ขยายพื้นที่ของข้อความ
16. **ScaffoldMessenger** - แสดง SnackBar
17. **Theme.of** - เข้าถึง theme

**จุดเด่น:**
- Profile header พร้อม gradient background
- Circle avatar แสดงตัวอักษรแรก
- Profile options (Edit, Orders, Wishlist, Addresses)
- Contact information section
- App version display

---

### 🎴 ProductCard Widget (lib/widgets/product_card.dart)
**Widgets ที่ใช้:**
1. **StatelessWidget** - reusable component
2. **Card** - กล่องที่มีเงา
3. **InkWell** - ripple effect เมื่อกด
4. **Column** - จัดเรียงในแนวตั้ง
5. **Expanded** - สำหรับรูปภาพ
6. **Container** - กล่องสำหรับรูป
7. **Image.network** - แสดงรูปสินค้า
8. **CircularProgressIndicator** - loading รูป
9. **Icon** - แสดง error icon
10. **Padding** - เพิ่มระยะห่าง
11. **Text** - แสดงชื่อและราคา
12. **Row** - แสดง rating
13. **SizedBox** - ช่องว่าง
14. **Theme.of** - เข้าถึง theme

**จุดเด่น:**
- Reusable component
- Image loading state
- Error handling
- Compact information display
- Tap callback

---

## 📊 สรุปจำนวน Widgets ที่ใช้

### Widgets หลัก (43 ชนิด):
1. **Layout** (13): Scaffold, AppBar, Column, Row, Container, SizedBox, Padding, Center, Expanded, SingleChildScrollView, SafeArea, Stack, Positioned
2. **Navigation** (2): Navigator, BottomNavigationBar
3. **Form** (5): Form, TextFormField, ElevatedButton, IconButton, TextButton
4. **List/Grid** (3): ListView, GridView.builder, ListTile
5. **State Management** (3): Provider, Consumer, ChangeNotifier
6. **Display** (7): Text, Icon, Image.network, CircularProgressIndicator, CircleAvatar, Divider, SnackBar
7. **Interactive** (5): InkWell, Card, FilterChip, RefreshIndicator, AlertDialog
8. **Styling** (5): Theme, MaterialApp, BoxDecoration, LinearGradient, BorderRadius

### การใช้งานแต่ละหน้า:
- **LoginScreen**: 20 widgets
- **HomeScreen**: 10 widgets
- **ProductsScreen**: 17 widgets
- **ProductDetailScreen**: 18 widgets
- **ContactScreen**: 17 widgets
- **ProductCard**: 14 widgets

---

## 🎯 หลักการเลือกใช้ Widgets

### 1. **StatelessWidget vs StatefulWidget**
- **StatelessWidget**: ใช้เมื่อไม่ต้องการเปลี่ยน state ภายใน (ProductCard, ContactScreen)
- **StatefulWidget**: ใช้เมื่อต้องการจัดการ state (LoginScreen, HomeScreen)

### 2. **Layout Widgets**
- **Column**: จัดเรียงในแนวตั้ง (ส่วนใหญ่ของหน้า)
- **Row**: จัดเรียงในแนวนอน (rating, icons)
- **ListView**: รายการแนวนอน/ตั้ง (category filters)
- **GridView**: แสดงเป็นตาราง (products)

### 3. **State Management**
- **Provider**: แบ่งปัน state ทั่วทั้งแอป
- **Consumer**: ฟัง state changes และ rebuild
- **setState**: จัดการ local state ในหน้าจอ

### 4. **Navigation**
- **Navigator.push**: ไปหน้าใหม่
- **Navigator.pushReplacement**: แทนที่หน้าปัจจุบัน
- **Navigator.pushAndRemoveUntil**: ล้างประวัติ

### 5. **Async Operations**
- **FutureBuilder**: แสดง UI ตาม Future state (ไม่ได้ใช้ในโปรเจคนี้)
- **Consumer + Provider**: ใช้แทน FutureBuilder

---

## 💡 เคล็ดลับการใช้ Widgets

### 1. **Performance**
- ใช้ `const` constructor เมื่อเป็นไปได้
- ใช้ ListView.builder / GridView.builder สำหรับรายการยาว
- แยก widgets ย่อยเป็น component (เช่น ProductCard)

### 2. **Code Organization**
- แยก widgets ย่อยเป็นไฟล์ใหม่เมื่อใช้ซ้ำ
- ใช้ private widgets (_CategoryChip, _ProfileOption) สำหรับ widgets ที่ใช้เฉพาะในไฟล์นั้น

### 3. **Responsive Design**
- ใช้ MediaQuery สำหรับขนาดหน้าจอ
- ใช้ Expanded และ Flexible สำหรับ responsive layout
- ใช้ SingleChildScrollView ป้องกัน overflow

### 4. **Error Handling**
- ใช้ errorBuilder ใน Image.network
- แสดง error state ใน Consumer
- ใช้ SnackBar แจ้งเตือนข้อผิดพลาด

### 5. **User Experience**
- ใช้ CircularProgressIndicator สำหรับ loading
- ใช้ RefreshIndicator สำหรับ pull-to-refresh
- ใช้ InkWell/Card สำหรับ ripple effect
- ใช้ AlertDialog สำหรับยืนยันการทำงาน

---

## 📚 แหล่งเรียนรู้เพิ่มเติม

1. **Official Flutter Documentation**: https://docs.flutter.dev/
2. **Widget Catalog**: https://docs.flutter.dev/ui/widgets
3. **Flutter Widget of the Week**: https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG
4. **Flutter Cookbook**: https://docs.flutter.dev/cookbook

---

## ✅ สรุป

โปรเจคนี้ใช้ **43 ชนิด widgets หลัก** ครอบคลุม:
- ✅ การจัดการ Layout และ UI
- ✅ การ Navigation ระหว่างหน้า
- ✅ การทำ Form และ Validation
- ✅ การแสดงรายการแบบ List และ Grid
- ✅ State Management ด้วย Provider
- ✅ การโหลดและแสดงรูปภาพจาก Network
- ✅ การจัดการ Loading และ Error States
- ✅ User Interactions และ Animations

เหมาะสำหรับผู้เริ่มต้นเรียนรู้ Flutter ที่ต้องการเห็นตัวอย่างการใช้งานจริง! 🚀
