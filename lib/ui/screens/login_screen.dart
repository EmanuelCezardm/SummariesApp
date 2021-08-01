import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

bool passwordVisible = false;

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  get onPressed => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          buildTitle(),
          buildForm(),
        ]),
      ),
    );
  }

  buildTitle() {
    return Container(
      width: 800,
      height: 250,
      color: AppColors.blue,
      padding: EdgeInsets.only(top: 100),
      child: Column(
        children: [
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

  buildForm() {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 0),
          height: 650,
          width: double.infinity,
          color: AppColors.blue,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(50),
                    topRight: const Radius.circular(50),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O campo é obrigatório!';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
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
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O campo é obrigatório!';
                          }
                          if (value.length < 5) {
                            return 'O campo deve ter pelo menos 8 caracteres';
                          }
                          return null;
                        },
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: AppColors.blue,
                            size: 40,
                          ),
                          labelText: 'Senha',
                          hintText: 'Digite sua senha',
                          suffixIcon: IconButton(
                            icon: passwordVisible
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off_outlined),
                            iconSize: 30,
                            onPressed: () => setState(() => passwordVisible
                                ? passwordVisible = false
                                : passwordVisible = true),
                            color: AppColors.blue,
                          ),
                          labelStyle: TextStyle(
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      buildSenha(),
                      buildButtom(),
                      buildLink(),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }

  buildSenha() {
    return GestureDetector(
      onTap: () {
        print('Foi clicado');
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

  buildButtom() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: AppColors.blue,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 50,
        ),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),
      onPressed: () {},
      icon: Icon(
        Icons.check,
        size: 40,
      ),
      label: Text('Entrar'),
    );
  }

  buildLink() {
    return GestureDetector(
      onTap: () {
        print('Foi clicado');
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
            color: AppColors.rose,
          ),
        ),
      ),
    );
  }
}
