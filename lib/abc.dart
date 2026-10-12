import 'package:flutter/material.dart';

class A extends StatelessWidget {
  const A({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A'), 
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Next'),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const B())
              );
            },
          )

      )
    );
    
  }
}


class B extends StatelessWidget {
  const B({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('B'), backgroundColor: Colors.lightGreen),
      body: Center(
        child: ElevatedButton(
          child: const Text('Next'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const C()),
            );
          },
        ),
      ),
    );
  }
}



class C extends StatelessWidget {
  const C({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('C'), backgroundColor: Colors.lightBlue),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to B'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const B()),
            );
          },
        ),
      ),
    );
  }
}
