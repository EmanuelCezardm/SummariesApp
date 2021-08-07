import 'package:flutter/material.dart';
import 'package:summaries_app/ui/screens/home_screen.dart';
import 'package:summaries_app/ui/screens/login_screen.dart';
import 'package:summaries_app/ui/styles/app_theme.dart';

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
      theme: AppTheme.theme,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
      },
      home: const LoginScreen(),
    );
  }
}
