import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => const DetailsScreen(),
    ),
  ],
);

void main() => runApp(MaterialApp.router(routerConfig: router));

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/details'),
              child: const Text('go (replace stack)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.push('/details'),
              child: const Text('push (add to stack)'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('pop'),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  const Product(this.name, this.price);
}

const products = [
  Product('Laptop', 999.0),
  Product('Phone', 599.5),
  Product('Headphones', 79.9),
];

// 6.5: one helper for the transition, used by every route
CustomTransitionPage<void> buildPage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.9, end: 1.0).animate(animation),
          child: child,
        ),
      );
    },
  );
}

final labRouter = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundScreen(), // 6.4
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) => buildPage(state, const MenuScreen()),
    ),
    // 6.2 path parameter
    GoRoute(
      path: '/product/:id',
      pageBuilder: (context, state) =>
          buildPage(state, ProductIdScreen(id: state.pathParameters['id']!)),
    ),
    // 6.3 object in extra
    GoRoute(
      path: '/product-details',
      pageBuilder: (context, state) =>
          buildPage(state, ProductScreen(product: state.extra as Product)),
    ),
    // 6.4 names
    GoRoute(
      name: 'settings',
      path: '/settings',
      pageBuilder: (context, state) => buildPage(state, const SettingsScreen()),
    ),
    GoRoute(
      name: 'item',
      path: '/item/:id',
      pageBuilder: (context, state) =>
          buildPage(state, ItemScreen(id: state.pathParameters['id']!)),
    ),
  ],
);

void task62() => runApp(MaterialApp.router(routerConfig: labRouter));

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('go_router tasks')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('6.2 Path parameters'),
          ElevatedButton(
            child: const Text('Product 1'),
            onPressed: () => context.push('/product/1'),
          ),
          ElevatedButton(
            child: const Text('Product 2'),
            onPressed: () => context.push('/product/2'),
          ),
          ElevatedButton(
            child: const Text('Product 3'),
            onPressed: () => context.push('/product/3'),
          ),
          const SizedBox(height: 24),
          const Text('6.3 Passing an object with extra'),
          for (final p in products)
            ListTile(
              title: Text(p.name),
              onTap: () => context.push('/product-details', extra: p),
            ),
          const SizedBox(height: 24),
          const Text('6.4 Named routes and 404 page'),
          ElevatedButton(
            child: const Text('Settings'),
            onPressed: () => context.goNamed('settings'),
          ),
          ElevatedButton(
            child: const Text('Item 42'),
            onPressed: () => context.goNamed('item', pathParameters: {'id': '42'}),
          ),
          ElevatedButton(
            child: const Text('Page that does not exist'),
            onPressed: () => context.go('/does-not-exist'),
          ),
        ],
      ),
    );
  }
}

class ProductIdScreen extends StatelessWidget {
  final String id;
  const ProductIdScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product')),
      body: Center(
        child: Text('Product #$id', style: const TextStyle(fontSize: 28)),
      ),
    );
  }
}

// After a browser reload extra is null (it only lives in memory), so
// `state.extra as Product` crashes. A path parameter is part of the URL,
// so it survives a reload and can be shared.
class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Center(
        child: Text('Price: \$${product.price}',
            style: const TextStyle(fontSize: 28)),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Home'),
          onPressed: () => context.goNamed('home'),
        ),
      ),
    );
  }
}

class ItemScreen extends StatelessWidget {
  final String id;
  const ItemScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item $id')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Home'),
          onPressed: () => context.goNamed('home'),
        ),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Page not found', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Home'),
              onPressed: () => context.goNamed('home'),
            ),
          ],
        ),
      ),
    );
  }
}
