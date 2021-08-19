import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryScreenState createState() => _PasswordRecoveryScreenState();
}

bool passwordVisible = true;

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

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
      height: size.height * .25,
      padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
            ),
            const Text(
              'Recuperação',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'de Senha',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildForm(size) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 32),
          height: size.height * .75,
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                        height: 56,
                      ),
                      _buildButtom(),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }

  _buildButtom() {
    return ElevatedButton(
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
        _functionRecuperar(context);
      },
      child: const Text('Recuperar'),
    );
  }

  _emailValidator() {
    (value) {
      if (value == null || value.isEmpty) {
        return 'O campo é obrigatório!';
      }
      if (!value.contains("@")) {
        return "O e-mail precisa do @";
      }
      return null;
    };
  }

  _functionRecuperar(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: AppColors.background,
          title: const AppText(
            fontSize: 20,
            text:
                'Será enviado uma mensagem para esse e-mail contendo os passos necessários para recuperar a senha.',
            align: TextAlign.center,
            fontFamily: 'Raleway',
          ),
          actions: [
            CupertinoButton(
              child: const AppText(
                fontSize: 20,
                fontFamily: 'Raleway',
                text: 'Ok',
                color: AppColors.blue,
                align: TextAlign.center,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
