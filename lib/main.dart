import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summaries_app/ui/screens/contents_screen.dart';
import 'package:summaries_app/ui/screens/about_screen.dart';
import 'package:summaries_app/ui/screens/favorites_screen.dart';
import 'package:summaries_app/ui/screens/home_screen.dart';
import 'package:summaries_app/ui/screens/profile_screen.dart';
import 'package:summaries_app/ui/screens/register_screen.dart';
import 'package:summaries_app/ui/screens/login_screen.dart';
import 'package:summaries_app/ui/styles/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Summaries App',
      theme: AppTheme.theme,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/contents': (context) => const ContentsScreen(),
        '/about': (context) => const AboutScreen(),
        '/register': (context) => const RegisterScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/favorites': (context) => const FavoritesScreen(),
      },
      home: const LoginScreen(),
    );
  }
}
