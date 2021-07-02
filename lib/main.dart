import 'package:flutter/material.dart';
import 'package:summaries_app/ui/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Summaries App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) => const HomePage(),
      },
      home: const HomePage(),
    );
  }
}
