# Flutter Ecommerce App

A simple Flutter ecommerce application demonstrating basic shopping functionality.

## Features

- **Product Catalog**: Browse a collection of products with names, descriptions, and prices
- **Product Details**: View detailed information about each product
- **Shopping Cart**: Add products to cart, adjust quantities, and remove items
- **Checkout**: Complete purchases with order confirmation

## Project Structure

```
lib/
├── main.dart                   # Application entry point
├── models/
│   ├── product.dart           # Product model and mock data
│   └── cart.dart              # Shopping cart model
├── screens/
│   ├── home_screen.dart       # Main product listing screen
│   ├── product_detail_screen.dart  # Product details screen
│   └── cart_screen.dart       # Shopping cart screen
└── widgets/
    └── product_card.dart      # Reusable product card widget
```

## Getting Started

### Prerequisites

- Flutter SDK (>=2.17.0)
- Dart SDK

### Installation

1. Clone the repository:
```bash
git clone https://github.com/somkheartk/flutter-lab-1-days.git
cd flutter-lab-1-days
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Usage

1. **Browse Products**: The home screen displays a grid of available products
2. **Add to Cart**: Click the "Add to Cart" button on any product card
3. **View Product Details**: Tap on a product card to see more details
4. **Manage Cart**: Access the cart via the shopping cart icon in the app bar
5. **Adjust Quantities**: Use +/- buttons in the cart to modify quantities
6. **Checkout**: Click the "Checkout" button to complete your purchase

## Technologies Used

- Flutter
- Dart
- Material Design 3

## License

This project is created for educational purposes as part of flutter-lab-1-days.