import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/data/dao/usersdao.dart';
import 'package:summaries_app/domain/model/user_model.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:summaries_app/ui/widgets/app_elevated_icon_button.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cepController = TextEditingController();
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTitle(),
            const SizedBox(height: 24),
            _buildForm(size),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.bottomLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.offWhite,
                size: 30,
              ),
            ),
          ),
          const Text(
            'Cadastre-se',
            style: TextStyle(
                fontSize: 60,
                fontFamily: "Trajan Pro",
                fontWeight: FontWeight.bold,
                color: AppColors.offWhite),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'para mais conteúdos incríveis',
            style: TextStyle(
                fontSize: 20,
                fontFamily: "Trajan Pro",
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
        ],
      ),
    );
  }

  _buildForm(size) {
    var mask = MaskTextInputFormatter(mask: "(##) # ####-####");
    var masks = MaskTextInputFormatter(mask: "#####-###");
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: size.height * .85,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      validator: _nomeValidator,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: AppColors.blue,
                          size: 40,
                        ),
                        labelText: 'Nome',
                        hintText: 'Digite seu nome',
                        labelStyle: TextStyle(
                          color: AppColors.blue,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      validator: _telefoneValidator,
                      inputFormatters: [mask],
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone_android_outlined,
                          color: AppColors.blue,
                          size: 40,
                        ),
                        labelText: 'Telefone',
                        hintText: 'Digite o número de telefone',
                        labelStyle: TextStyle(
                          color: AppColors.blue,
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: _emailValidator,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.blue,
                          size: 40,
                        ),
                        labelText: 'E-mail',
                        hintText: 'Digite seu e-mail',
                        labelStyle: TextStyle(
                          color: AppColors.blue,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
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
                        labelStyle: const TextStyle(
                          color: AppColors.blue,
                        ),
                        suffixIcon: IconButton(
                          icon: passwordVisible
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined),
                          iconSize: 30,
                          onPressed: () => setState(() => passwordVisible
                              ? passwordVisible = false
                              : passwordVisible = true),
                          color: AppColors.blue,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _cepController,
                      validator: _cepValidator,
                      inputFormatters: [masks],
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.add_location_alt_outlined,
                          color: AppColors.blue,
                          size: 40,
                        ),
                        labelText: 'CEP',
                        hintText: 'Digite seu CEP',
                        labelStyle: TextStyle(
                          color: AppColors.blue,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppElevatedIconButton(
                      onPressed: _buildFunctionRegister,
                      icon: Icons.check,
                      text: 'Cadastrar',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _buildFunctionRegister() async {
    if (!_formKey.currentState!.validate()) return;

    final user = UserModel(
      _nameController.text,
      _phoneController.text,
      _emailController.text,
      _passwordController.text,
      false,
      _cepController.text,
    );

    final list = await UserDao().fetchUserByEmail(_emailController.text);

    if (list.isEmpty) {
      UserDao().addUser(user);
      _functionShowDialog(
        context,
        'Usuário cadastrado com sucesso.',
        () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    } else {
      _functionShowDialog(
        context,
        'Email já cadastrado.',
        () {
          Navigator.pop(context);
        },
      );
    }
  }

  String? _nomeValidator(value) {
    if (value == null || value.isEmpty) {
      return 'O campo é obrigatório!';
    }
    if (value.length < 5) {
      return 'O campo deve ter pelo menos 5 caracteres';
    }
    return null;
  }

  String? _telefoneValidator(value) {
    if (value == null || value.isEmpty) {
      return 'O campo é obrigatório!';
    }
    if (value.length < 16 && value.isNotEmpty) {
      return 'Preencha o campo corretamente';
    }
    return null;
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

  String? _cepValidator(value) {
    if (value == null || value.isEmpty) {
      return 'O campo é obrigatório!';
    }
    if (value.length < 9 && value.isNotEmpty) {
      return 'Preencha o campo corretamente';
    }
    return null;
  }

  _functionShowDialog(context, text, function) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: AppColors.background,
          title: AppText(
            fontSize: 20,
            text: text,
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
              onPressed: function,
            ),
          ],
        );
      },
    );
  }
}
