import 'package:flutter/material.dart';
import 'push_pop.dart' as push_pop;
import 'named_routes.dart' as named_routes;
import 'constructor_args.dart' as constructor_args;
import 'named_args.dart' as named_args;
import 'transitions.dart' as transitions;
import 'go_router_tasks.dart' as go_router_tasks;

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab 5 tasks')),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              '1.1, 1.2, 1.3, 2.1, 2.2, 2.3 and the drawer (2.4) are in the main app. '
              'Tap a task to run it, press R (hot restart) to come back.',
            ),
          ),
          ListTile(title: const Text('1.4'), onTap: () => push_pop.task14()),
          ListTile(title: const Text('1.5'), onTap: () => push_pop.task15()),
          ListTile(title: const Text('2.5'), onTap: () => named_routes.task25()),
          ListTile(title: const Text('3.1'), onTap: () => constructor_args.main()),
          ListTile(title: const Text('3.2'), onTap: () => constructor_args.task32()),
          ListTile(title: const Text('3.3'), onTap: () => constructor_args.task33()),
          ListTile(title: const Text('3.4'), onTap: () => constructor_args.task34()),
          ListTile(title: const Text('3.5'), onTap: () => constructor_args.task35()),
          ListTile(title: const Text('4.1'), onTap: () => named_args.main()),
          ListTile(title: const Text('4.2'), onTap: () => named_args.task42()),
          ListTile(title: const Text('4.3'), onTap: () => named_args.task43()),
          ListTile(title: const Text('4.4'), onTap: () => named_args.task44()),
          ListTile(title: const Text('4.5'), onTap: () => named_args.task45()),
          ListTile(title: const Text('5.1'), onTap: () => transitions.main()),
          ListTile(title: const Text('5.2, 5.3, 5.4'), onTap: () => transitions.task52()),
          ListTile(title: const Text('5.5'), onTap: () => transitions.task55()),
          ListTile(title: const Text('6.1'), onTap: () => go_router_tasks.main()),
          ListTile(title: const Text('6.2, 6.3, 6.4, 6.5'), onTap: () => go_router_tasks.task62()),
        ],
      ),
    );
  }
}
