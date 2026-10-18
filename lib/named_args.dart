import 'package:flutter/material.dart';


class ScreenArguments {
  final String title;
  final String message;
  const ScreenArguments(this.title, this.message);
}

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeScreen(),
      '/details': (context) => const DetailsScreen(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Send arguments'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: const ScreenArguments('Welcome', 'Sent from Home'),
            );
          },
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: Center(child: Text(args.message)),
    );
  }
}

void task42() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const NumbersScreen(),
      '/square': (context) => const SquareScreen(),
    },
  ));
}

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Numbers')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('1'),
              onPressed: () => Navigator.pushNamed(context, '/square', arguments: 1),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('2'),
              onPressed: () => Navigator.pushNamed(context, '/square', arguments: 2),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('3'),
              onPressed: () => Navigator.pushNamed(context, '/square', arguments: 3),
            ),
          ],
        ),
      ),
    );
  }
}

class SquareScreen extends StatelessWidget {
  const SquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final n = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(title: const Text('Square')),
      body: Center(
        child: Text('$n squared is ${n * n}', style: const TextStyle(fontSize: 28)),
      ),
    );
  }
}

class User {
  final String name;
  final int age;
  final String city;
  const User(this.name, this.age, this.city);
}

const users = [
  User('Ali', 20, 'Tashkent'),
  User('Dilnoza', 19, 'Samarkand'),
  User('Jasur', 22, 'Termez'),
  User('Madina', 21, 'Bukhara'),
];

void task43() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const UsersScreen(),
      '/profile': (context) => const UserScreen(),
    },
  ));
}

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: ListView(
        children: [
          for (final u in users)
            ListTile(
              title: Text(u.name),
              onTap: () => Navigator.pushNamed(context, '/profile', arguments: u),
            ),
        ],
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${user.name}', style: const TextStyle(fontSize: 24)),
            Text('Age: ${user.age}', style: const TextStyle(fontSize: 24)),
            Text('City: ${user.city}', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

void task44() {
  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: (settings) {
      if (settings.name == '/') {
        return MaterialPageRoute(builder: (c) => const UsersScreen());
      }
      if (settings.name == '/profile') {
        final args = settings.arguments;
        if (args is User) {
          return MaterialPageRoute(builder: (c) => ProfileScreen(user: args));
        }
      }
      return null;
    },
  ));
}

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${user.name}', style: const TextStyle(fontSize: 24)),
            Text('Age: ${user.age}', style: const TextStyle(fontSize: 24)),
            Text('City: ${user.city}', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

void task45() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const MovieScreen(),
      '/rate': (context) => const RateScreen(),
    },
  ));
}

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  int? rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // after the back arrow the result is null, so this text does not change
            Text(
              rating == null ? 'Movie: not rated yet' : 'Movie: $rating/5',
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Rate Inception'),
              onPressed: () async {
                final result = await Navigator.pushNamed<int>(
                  context,
                  '/rate',
                  arguments: 'Inception',
                );
                if (!mounted) return;
                if (result != null) {
                  setState(() {
                    rating = result;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 1; i <= 5; i++)
              IconButton(
                icon: const Icon(Icons.star, color: Colors.amber),
                onPressed: () => Navigator.pop(context, i),
              ),
          ],
        ),
      ),
    );
  }
}
