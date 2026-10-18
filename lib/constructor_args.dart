import 'package:flutter/material.dart';

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

void main() => runApp(const MaterialApp(home: ProductListScreen()));

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView(
        children: [
          for (final p in products)
            ListTile(
              title: Text(p.name),
              subtitle: Text('\$${p.price}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(product: p),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

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


void task32() => runApp(const MaterialApp(home: NameScreen()));

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Name')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Your name'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Greet'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GreetingScreen(name: controller.text),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GreetingScreen extends StatelessWidget {
  final String name;
  const GreetingScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Greeting')),
      body: Center(
        child: Text('Hello, $name!', style: const TextStyle(fontSize: 28)),
      ),
    );
  }
}

class Contact {
  final String name;
  final String phone;
  final String email;
  const Contact(this.name, this.phone, this.email);
}

const contacts = [
  Contact('Ali Karimov', '+998 90 111 22 33', 'ali@mail.uz'),
  Contact('Dilnoza Yusupova', '+998 91 222 33 44', 'dilnoza@mail.uz'),
  Contact('Jasur Tursunov', '+998 93 333 44 55', 'jasur@mail.uz'),
  Contact('Madina Rahimova', '+998 94 444 55 66', 'madina@mail.uz'),
  Contact('Sardor Aliyev', '+998 97 555 66 77', 'sardor@mail.uz'),
];

void task33() => runApp(const MaterialApp(home: ContactListScreen()));

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView(
        children: [
          for (final c in contacts)
            ListTile(
              title: Text(c.name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactScreen(contact: c)),
                );
              },
            ),
        ],
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final Contact contact;
  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(contact.name, style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 12),
                Text('Phone: ${contact.phone}'),
                const SizedBox(height: 8),
                Text('Email: ${contact.email}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void task34() => runApp(const MaterialApp(home: SquareScreen()));

class SquareScreen extends StatefulWidget {
  const SquareScreen({super.key});

  @override
  State<SquareScreen> createState() => _SquareScreenState();
}

class _SquareScreenState extends State<SquareScreen> {
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Square')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 100, height: 100, color: color),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Choose colour'),
              onPressed: () async {
                final c = await Navigator.push<Color>(
                  context,
                  MaterialPageRoute(builder: (context) => const ColorScreen()),
                );
                if (!mounted) return;
                if (c != null) {
                  setState(() {
                    color = c;
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

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Colour')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(context, Colors.red),
              child: const Text('Red'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => Navigator.pop(context, Colors.green),
              child: const Text('Green'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () => Navigator.pop(context, Colors.blue),
              child: const Text('Blue'),
            ),
          ],
        ),
      ),
    );
  }
}

void task35() => runApp(const MaterialApp(home: CounterScreen()));

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Value: $value', style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Edit'),
              onPressed: () async {
                final result = await Navigator.push<int>(
                  context,
                  MaterialPageRoute(builder: (context) => EditorScreen(value: value)),
                );
                if (!mounted) return;
                // the back arrow gives null, so the old value stays
                if (result != null) {
                  setState(() {
                    value = result;
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

class EditorScreen extends StatefulWidget {
  final int value;
  const EditorScreen({super.key, required this.value});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  int current = 0;

  @override
  void initState() {
    super.initState();
    current = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editor')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$current', style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('-'),
                  onPressed: () {
                    setState(() {
                      current--;
                    });
                  },
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  child: const Text('+'),
                  onPressed: () {
                    setState(() {
                      current++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () => Navigator.pop(context, current),
            ),
          ],
        ),
      ),
    );
  }
}
