import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summaries_app/ui/screens/main/contents_screen.dart';
import 'package:summaries_app/ui/screens/menu/about_screen.dart';
import 'package:summaries_app/ui/screens/menu/favorites_screen.dart';
import 'package:summaries_app/ui/screens/main/home_screen.dart';
import 'package:summaries_app/ui/screens/user/password_recovery_screen.dart';
import 'package:summaries_app/ui/screens/menu/profile_screen.dart';
import 'package:summaries_app/ui/screens/user/register_screen.dart';
import 'package:summaries_app/ui/screens/user/login_screen.dart';
import 'package:summaries_app/ui/screens/splash/splash_screen.dart';
import 'package:summaries_app/ui/screens/main/summaries_screen.dart';
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
        '/about': (context) => const AboutScreen(),
        '/register': (context) => const RegisterScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/summaries': (context) => const SummariesScreen(),
        '/favorites': (context) => const FavoritesScreen(),
        '/passwordRecovery': (context) => const PasswordRecoveryScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
