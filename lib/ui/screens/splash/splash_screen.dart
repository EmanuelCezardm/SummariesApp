import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summaries_app/data/dao/usersdao.dart';
import 'package:summaries_app/data/shared_preferences_helper.dart';
import 'package:summaries_app/ui/screens/main/home_screen.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.blue,
        systemNavigationBarColor: Colors.black,
      ),
    );
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

  _loadData() async {
    SharedPreferencesHelper sharedPreferences = SharedPreferencesHelper();
    Map user = await sharedPreferences.getUser();

    if (user['USERLOGGED']) {
      final list = await UserDao()
          .fetchUserByEmailPassword(user['USEREMAIL'], user['USERPASSWORD']);
      return splash(context, list[0], 1);
    } else {
      return splash(context, null, 0);
    }
  }

  void splash(context, user, page) {
    Future.delayed(const Duration(milliseconds: 2500)).then(
      (value) {
        if (page == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                user: user,
              ),
            ),
          );
        } else {
          Navigator.pushReplacementNamed(context, "/login");
        }
      },
    );
  }
}
