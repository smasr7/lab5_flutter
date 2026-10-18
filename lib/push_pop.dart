import 'package:flutter/material.dart';

void task14() => runApp(const MaterialApp(home: StepScreen(step: 1)));

class StepScreen extends StatelessWidget {
  final int step;
  const StepScreen({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    Widget button;
    if (step < 4) {
      button = ElevatedButton(
        child: const Text('Next'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StepScreen(step: step + 1)),
          );
        },
      );
    } else {
      button = ElevatedButton(
        child: const Text('Finish'),
        onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('Step $step')),
      body: Center(child: button),
    );
  }
}


void task15() => runApp(const MaterialApp(home: RootScreen()));

class BackOrExitButton extends StatelessWidget {
  const BackOrExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (Navigator.canPop(context)) {
      return ElevatedButton(
        child: const Text('Back'),
        onPressed: () => Navigator.pop(context),
      );
    }
    // onPressed: null makes the button disabled
    return const ElevatedButton(
      onPressed: null,
      child: Text('Nothing to go back to'),
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Root')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BackOrExitButton(),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Open pushed screen'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PushedScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PushedScreen extends StatelessWidget {
  const PushedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pushed')),
      body: const Center(child: BackOrExitButton()),
    );
  }
}
