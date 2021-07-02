import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('SummariesApp'),
      ),
      body: const Center(
        child: Text(
          'Oi!',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    ));
  }
}
