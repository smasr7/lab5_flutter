import 'package:flutter/material.dart';
import 'abc.dart';
import 'login.dart';

class AppRoutes {
  static const home = '/';
  static const settings = '/settings';
  static const profile = '/profile';
  static const message = '/message';
  static const about = '/about';
}

void main() {
  runApp(MaterialApp(
    initialRoute: AppRoutes.home,
    routes: {
      AppRoutes.home: (context) => const HomeScreen(),
      AppRoutes.settings: (context) => const SettingsScreen(),
      AppRoutes.profile: (context) => const ProfileScreen(),
      AppRoutes.message: (context) => const MessageScreen(),
      AppRoutes.about: (context) => const AboutScreen(),
    },
    onUnknownRoute: (settings) => MaterialPageRoute(
      builder: (context) => const NotFoundScreen(),
    ),
    ));
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: isLoggedIn,
            builder: (context, loggedIn, _){
              if (loggedIn){
                return TextButton(
                  onPressed: () => isLoggedIn.value = false,
                  child: const Text('Logout'),
                );
              }
              return  TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login())
                  );
                },
                child: const Text('Login'),
              );
            }
          )
        ],
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Open Details'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailsScreen()));
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Go to A'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const A()));
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Settings'),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Open Unknown Route'),
              onPressed: () => Navigator.pushNamed(context, '/does-not-exist'),
            ),
            const SizedBox(height: 16),
            ListView(
              shrinkWrap: true,
              children: [          
                ListTile(
                  title: const Text('Profile'),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
                ),
                ListTile(
                  title: const Text('Message'),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.message),
                ),
                ListTile(
                  title: const Text('About'),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.about),
                ),
              ],
            )
          ]
        )
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
          child: const Text('Go back'),
          onPressed: () => Navigator.pop(context),
        ),
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
          onPressed: () => Navigator.pop(context),
          child: const Text('Back')
          ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Back'),
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Back'),
        ),
      ),
    );
  }
}

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Back'),
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
              onPressed: () => Navigator.pop(context),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
