import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: size.height * .8,
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
                      validator: _nomeValidator(),
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
                      validator: _telefoneValidator(),
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
                      validator: _emailValidator(),
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
                        validator: _senhaValidator(),
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: AppColors.blue,
                            size: 40,
                          ),
                          labelText: 'Senha',
                          hintText: 'Digite sua senha',
                          labelStyle: TextStyle(
                            color: AppColors.blue,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword),
                    const SizedBox(
                      height: 64,
                    ),
                    _buildButtom(size),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _nomeValidator() {
    (value) {
      if (value == null || value.isEmpty) {
        return 'O campo é obrigatório!';
      }
      if (value.length < 5) {
        return 'O campo deve ter pelo menos 5 caracteres';
      }
      return null;
    };
  }

  _telefoneValidator() {
    (value) {
      if (value == null || value.isEmpty) {
        return 'O campo é obrigatório!';
      }
      return null;
    };
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

  _buildButtom(size) {
    return SizedBox(
      width: size.width,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          primary: AppColors.lilas,
          padding: const EdgeInsets.symmetric(vertical: 20),
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
        onPressed: () {
          debugPrint('sucesso');
        },
        icon: const Icon(
          Icons.check,
          size: 32,
        ),
        label: const Text('Cadastrar'),
      ),
    );
  }
}
