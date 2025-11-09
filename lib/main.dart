import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/product_provider.dart';

/// Main entry point of the Flutter application
/// 
/// This is where the app starts. We wrap our app with providers
/// for state management using the Provider package.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiProvider allows us to use multiple providers throughout the app
    return MultiProvider(
      providers: [
        // AuthProvider manages authentication state (login/logout)
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        // ProductProvider manages product data from API
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Lab 1 Days',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Using Material 3 design
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          // Custom app bar theme
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 2,
          ),
        ),
        // Start with the login screen
        home: const LoginScreen(),
      ),
    );
  }
}
