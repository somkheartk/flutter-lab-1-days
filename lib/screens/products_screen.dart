import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

/// ProductsScreen - Displays list of products from API
/// 
/// This screen demonstrates:
/// - Fetching data from an API
/// - Displaying data in a grid
/// - Loading and error states
/// - Navigation to detail screen
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        // Show loading indicator while fetching data
        if (productProvider.isLoading && productProvider.products.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Show error message if fetch failed
        if (productProvider.error != null && productProvider.products.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error: ${productProvider.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => productProvider.fetchProducts(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        // Show products in a grid
        final products = productProvider.products;

        if (products.isEmpty) {
          return const Center(
            child: Text('No products found'),
          );
        }

        return RefreshIndicator(
          onRefresh: () => productProvider.fetchProducts(),
          child: Column(
            children: [
              // Category filter section
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _CategoryChip(
                      label: 'All',
                      isSelected: true,
                      onTap: () {},
                    ),
                    ...productProvider.getCategories().map(
                          (category) => _CategoryChip(
                            label: category,
                            isSelected: false,
                            onTap: () {},
                          ),
                        ),
                  ],
                ),
              ),
              
              // Products grid
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(
                              product: product,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Category chip widget for filtering
class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => onTap(),
      ),
    );
  }
}
