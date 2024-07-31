import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JailBrakePage extends StatelessWidget {
  const JailBrakePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.warning, color: Colors.red, size: 100),
            const Text(
              'Jail Brake Detected!',
              style: TextStyle(fontSize: 30),
            ),
            const Text('You cannot continue using this app'),
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text('Close this App'))
          ],
        ),
      ),
    );
  }
}


