import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

/// ContactScreen - User profile and contact information
/// 
/// This screen demonstrates:
/// - Displaying user information
/// - List of settings/options
/// - Contact information
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
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
            child: Column(
              children: [
                // Profile avatar
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Text(
                    user?.name.substring(0, 1).toUpperCase() ?? 'U',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // User name
                Text(
                  user?.name ?? 'User',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                
                // User email
                Text(
                  user?.email ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Profile options
          _ProfileOption(
            icon: Icons.person,
            title: 'Edit Profile',
            subtitle: 'Update your personal information',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit Profile (Demo)')),
              );
            },
          ),

          _ProfileOption(
            icon: Icons.shopping_bag,
            title: 'My Orders',
            subtitle: 'View your order history',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('My Orders (Demo)')),
              );
            },
          ),

          _ProfileOption(
            icon: Icons.favorite,
            title: 'Wishlist',
            subtitle: 'Your saved products',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Wishlist (Demo)')),
              );
            },
          ),

          _ProfileOption(
            icon: Icons.location_on,
            title: 'Addresses',
            subtitle: 'Manage your delivery addresses',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Addresses (Demo)')),
              );
            },
          ),

          const Divider(height: 32),

          // Contact section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Us',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                
                _ContactItem(
                  icon: Icons.email,
                  title: 'Email',
                  value: 'support@fluttershop.com',
                ),
                const SizedBox(height: 12),
                
                _ContactItem(
                  icon: Icons.phone,
                  title: 'Phone',
                  value: '+1 (234) 567-8900',
                ),
                const SizedBox(height: 12),
                
                _ContactItem(
                  icon: Icons.language,
                  title: 'Website',
                  value: 'www.fluttershop.com',
                ),
                const SizedBox(height: 12),
                
                _ContactItem(
                  icon: Icons.location_city,
                  title: 'Address',
                  value: '123 Flutter Street, Mobile City, FC 12345',
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // App version
          Text(
            'Version 1.0.0',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// Widget for profile options
class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

/// Widget for contact information items
class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
