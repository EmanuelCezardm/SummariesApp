import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:summaries_app/ui/widgets/app_drawer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  get onPressed => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [buildTitle(), buildForm()],
        ),
      ),
    );
  }

  buildTitle() {
    return Container(
      width: 800,
      height: 250,
      color: AppColors.darkBlue,
      padding: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text(
            'Cadastro',
            style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w500,
                color: AppColors.offWhite),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Cadastre-se para mais conteúdos incríveis',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.offWhite),
          ),
        ],
      ),
    );
  }

  buildForm() {
    var mask = MaskTextInputFormatter(mask: "(##) # ####-####");
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 40),
          height: 830,
          width: double.infinity,
          color: AppColors.darkBlue,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(50),
                    topRight: const Radius.circular(50),
                  )),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 90, horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O campo é obrigatório!';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: AppColors.darkBlue,
                            size: 40,
                          ),
                          labelText: 'Nome',
                          hintText: 'Digite seu nome',
                          labelStyle: TextStyle(
                            color: AppColors.darkBlue,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O campo é obrigatório!';
                          }

                          return null;
                        },
                        inputFormatters: [mask],
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone_android_outlined,
                            color: AppColors.darkBlue,
                            size: 40,
                          ),
                          labelText: 'Telefone',
                          hintText: 'Digite o número de telefone',
                          labelStyle: TextStyle(
                            color: AppColors.darkBlue,
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                            color: AppColors.darkBlue,
                            size: 40,
                          ),
                          labelText: 'E-mail',
                          hintText: 'Digite seu e-mail',
                          labelStyle: TextStyle(
                            color: AppColors.darkBlue,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'O campo é obrigatório!';
                            }
                            if (value.length < 5) {
                              return 'O campo deve ter pelo menos 8 caracteres';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.password_sharp,
                              color: AppColors.darkBlue,
                              size: 40,
                            ),
                            labelText: 'Senha',
                            hintText: 'Digite sua senha',
                            labelStyle: TextStyle(
                              color: AppColors.darkBlue,
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword),
                      SizedBox(
                        height: 80,
                      ),
                      buildButtom(),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }

  buildButtom() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: AppColors.rose,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 150),
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
      label: Text('Salvar'),
    );
  }
}
