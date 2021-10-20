import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summaries_app/data/dao/usersdao.dart';
import 'package:summaries_app/ui/screens/main/home_screen.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_elevated_icon_button.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

bool passwordVisible = true;

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  get onPressed => null;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SingleChildScrollView(
        child: Column(children: [
          _buildTitle(size),
          _buildBody(size),
        ]),
      ),
    );
  }

  _buildTitle(size) {
    return Container(
      width: size.width,
      height: size.height * .2,
      padding: const EdgeInsets.only(top: 35),
      child: Column(
        children: const [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Bem-vindo',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  _buildBody(size) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 24),
          height: size.height * .8,
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: _buildForm(),
              )),
        ),
      ],
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            validator: _emailValidator,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.email_outlined,
                color: AppColors.blue,
                size: 40,
              ),
              labelText: 'Email',
              hintText: 'Digite seu email',
              labelStyle: TextStyle(
                color: AppColors.blue,
              ),
            ),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            validator: _senhaValidator,
            obscureText: passwordVisible,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: AppColors.blue,
                size: 40,
              ),
              labelText: 'Senha',
              hintText: 'Digite sua senha',
              suffixIcon: _buildVisibleIconButton(),
              labelStyle: const TextStyle(
                color: AppColors.blue,
              ),
            ),
          ),
          const SizedBox(
            height: 56,
          ),
          _buildSenha(),
          AppElevatedIconButton(
            onPressed: _formValidator,
            icon: Icons.check,
            text: 'Entrar',
          ),
          _buildLink(),
        ],
      ),
    );
  }

  _formValidator() async {
    if (!_formKey.currentState!.validate()) return;

    final list = await UserDao().fetchUserByEmailPassword(
        _emailController.text, _passwordController.text);
    if (list.isEmpty) {
      _functionUserIsEmpty(context);
    } else {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            user: list[0],
          ),
        ),
      );
    }
  }

  _functionUserIsEmpty(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: AppColors.background,
          title: const AppText(
            fontSize: 20,
            text: 'Usuário não encontrado.',
            align: TextAlign.center,
            fontFamily: 'Raleway',
          ),
          actions: [
            CupertinoButton(
              child: const AppText(
                fontSize: 20,
                fontFamily: 'Raleway',
                text: 'OK',
                color: AppColors.blue,
                align: TextAlign.center,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  _buildSenha() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/passwordRecovery');
      },
      child: Container(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 25,
        ),
        child: const Text(
          'Esqueci a senha',
          style: TextStyle(
            fontSize: 15,
            color: AppColors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _buildLink() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/register');
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 25,
          bottom: 125,
        ),
        child: const Text(
          'Cadastre-se',
          style: TextStyle(
            fontSize: 15,
            decoration: TextDecoration.underline,
            color: AppColors.lilas,
          ),
        ),
      ),
    );
  }

  String? _emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'O campo é obrigatório!';
    }
    if (value.length < 8) {
      return 'O campo deve ter pelo menos 8 caracteres';
    } else if (!value.contains("@")) {
      return "O e-mail precisa do @";
    }
    return null;
  }

  String? _senhaValidator(value) {
    if (value == null || value.isEmpty) {
      return 'O campo é obrigatório!';
    }
    if (value.length < 8) {
      return 'O campo deve ter pelo menos 8 caracteres';
    }
    return null;
  }

  _buildVisibleIconButton() {
    return IconButton(
      icon: passwordVisible
          ? const Icon(Icons.visibility_outlined)
          : const Icon(Icons.visibility_off_outlined),
      iconSize: 30,
      onPressed: () => setState(() =>
          passwordVisible ? passwordVisible = false : passwordVisible = true),
      color: AppColors.blue,
    );
  }
}
