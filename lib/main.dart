import 'package:flutter/material.dart';
import 'abc.dart';
import 'login.dart';


void main() {
  runApp(const MaterialApp(home: HomeScreen(),));
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


