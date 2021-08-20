import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splash(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void splash(context) {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      Navigator.popAndPushNamed(context, "/login");
    });
  }
}
