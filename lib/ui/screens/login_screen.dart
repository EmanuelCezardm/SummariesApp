import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

bool passwordVisible = true;

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  get onPressed => null;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SingleChildScrollView(
        child: Column(children: [
          _buildTitle(size),
          _buildForm(size),
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
                fontSize: 80, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Bem-vindo de volta',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
    );
  }

  _buildForm(size) {
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        validator: _emailValidator(),
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
                        validator: _senhaValidator(),
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
                      _buildButtom(),
                      _buildLink(),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }

  _buildSenha() {
    return GestureDetector(
      onTap: () {
        debugPrint('Foi clicado');
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

  _buildButtom() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: AppColors.blue,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 50,
        ),
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/home');
      },
      icon: const Icon(
        Icons.check,
        size: 40,
      ),
      label: const Text('Entrar'),
    );
  }

  _buildLink() {
    return GestureDetector(
      onTap: () {
        Navigator.popAndPushNamed(context, '/register');
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

  _emailValidator() {
    (value) {
      if (value == null || value.isEmpty) {
        return 'O campo é obrigatório!';
      }
      if (value.length < 8) {
        return 'O campo deve ter pelo menos 8 caracteres';
      } else if (!value.contains("@")) {
        return "O e-mail precisa do @";
      }
      return null;
    };
  }

  _senhaValidator() {
    (value) {
      if (value == null || value.isEmpty) {
        return 'O campo é obrigatório!';
      }
      if (value.length < 9) {
        return 'O campo deve ter pelo menos 8 caracteres';
      }
      return null;
    };
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
