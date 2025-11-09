import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/product_provider.dart';
import 'products_screen.dart';
import 'contact_screen.dart';
import 'login_screen.dart';

/// HomeScreen - Main navigation hub of the app
/// 
/// This screen uses a BottomNavigationBar to switch between:
/// - Products (E-commerce listings)
/// - Contact/Profile page
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // List of screens to display
  final List<Widget> _screens = [
    const ProductsScreen(),
    const ContactScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // Fetch products when home screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  void _handleLogout() {
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
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Shop'),
        actions: [
          // Display user name
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Hi, ${authProvider.user?.name ?? "User"}',
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          // Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _handleLogout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
