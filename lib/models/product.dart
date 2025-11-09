class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// Mock data for products
List<Product> getProducts() {
  return [
    Product(
      id: 1,
      name: 'Smartphone',
      description: 'Latest model with advanced features',
      price: 599.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Smartphone',
    ),
    Product(
      id: 2,
      name: 'Laptop',
      description: 'High-performance laptop for work and gaming',
      price: 1299.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Laptop',
    ),
    Product(
      id: 3,
      name: 'Headphones',
      description: 'Wireless noise-cancelling headphones',
      price: 199.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Headphones',
    ),
    Product(
      id: 4,
      name: 'Smart Watch',
      description: 'Fitness tracker with health monitoring',
      price: 299.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Smart+Watch',
    ),
    Product(
      id: 5,
      name: 'Tablet',
      description: 'Portable tablet for entertainment',
      price: 449.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Tablet',
    ),
    Product(
      id: 6,
      name: 'Camera',
      description: 'Professional digital camera',
      price: 899.99,
      imageUrl: 'https://via.placeholder.com/300x300?text=Camera',
    ),
  ];
}
