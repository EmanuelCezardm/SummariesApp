import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:summaries_app/data/dao/usersdao.dart';
import 'package:summaries_app/domain/model/user_model.dart';
import 'package:summaries_app/ui/screens/menu/profile_screen.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;

  const EditProfileScreen({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var mask = MaskTextInputFormatter(mask: "(##) 9 ####-####");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  UserModel get user => widget.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(''),
      body: _buildBody(),
      backgroundColor: AppColors.white,
    );
  }

  _buildAppBar(String title) {
    return AppAppBar(
      iconColor: AppColors.blue,
      onTapBack: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(user: user),
          ),
        );
      },
      color: AppColors.white,
      title: title,
      size: MediaQuery.of(context).size,
    );
  }

  _buildBody() {
    return ListView(
      children: [
        const AppText(
          text: 'Editar Perfil',
          fontSize: 36,
          align: TextAlign.center,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(8, 48, 8, 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: AppColors.white,
          ),
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 46),
          child: Column(
            children: [
              _buildForm(),
              Container(
                margin: const EdgeInsets.only(top: 32),
                child: _buildButtons(),
              ),
            ],
          ),
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
            enabled: false,
            decoration: const InputDecoration(
              disabledBorder: InputBorder.none,
              labelText: 'Nome Atual',
              labelStyle: TextStyle(
                fontSize: 28,
                color: AppColors.blue,
              ),
            ),
            initialValue: user.name,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            enabled: false,
            decoration: const InputDecoration(
              disabledBorder: InputBorder.none,
              labelText: 'Telefone Atual',
              labelStyle: TextStyle(
                fontSize: 28,
                color: AppColors.blue,
              ),
            ),
            initialValue: user.cellPhone,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          TextFormField(
            controller: _nameController,
            validator: _nameValidator,
            decoration: const InputDecoration(
              disabledBorder: InputBorder.none,
              labelText: 'Novo Nome',
              labelStyle: TextStyle(
                fontSize: 28,
                color: AppColors.blue,
              ),
            ),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          TextFormField(
            controller: _phoneController,
            validator: _phoneValidator,
            decoration: const InputDecoration(
              labelText: 'Novo Telefone',
              labelStyle: TextStyle(
                fontSize: 28,
                color: AppColors.blue,
              ),
            ),
            style: const TextStyle(
              fontSize: 20,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [mask],
          ),
        ],
      ),
    );
  }

  Row _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.lilas,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "CANCELAR",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: _edit,
            style: ElevatedButton.styleFrom(
              primary: AppColors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              "SALVAR",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String? _nameValidator(value) {
    if (value.length < 5 && value.isNotEmpty) {
      return 'O campo deve ter pelo menos 5 caracteres';
    }
    if (value == user.name) {
      return 'Insira um nome diferente do atual';
    }
    return null;
  }

  String? _phoneValidator(value) {
    if (value.length < 16 && value.isNotEmpty) {
      return 'Preencha o campo corretamente';
    }
    if (value == user.cellPhone) {
      return 'Insira um telefone diferente do atual';
    }
    return null;
  }

  _edit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_nameController.text.isEmpty && _phoneController.text.isNotEmpty) {
      UserDao().updateCellPhone(user.email, _phoneController.text);
      user.setCellPhone(_phoneController.text);
      _functionShowDialog(context, 'Telefone alterado com sucesso');
    } else if (_nameController.text.isNotEmpty &&
        _phoneController.text.isEmpty) {
      UserDao().updateName(user.email, _nameController.text);
      user.setName(_nameController.text);
      _functionShowDialog(context, 'Nome alterado com sucesso');
    } else if (_nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty) {
      UserDao().updateCellPhone(user.email, _phoneController.text);
      UserDao().updateName(user.email, _nameController.text);
      user.setCellPhone(_phoneController.text);
      user.setName(_nameController.text);
      _functionShowDialog(context, 'Nome e Telefone alterados com sucesso');
    } else if (_nameController.text.isEmpty && _phoneController.text.isEmpty) {
      _functionShowDialog(context, 'Você não alterou nenhum valor');
    }
  }

  _functionShowDialog(context, text) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,
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
                text: 'Continuar',
                color: AppColors.blue,
                align: TextAlign.center,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoButton(
              child: const AppText(
                fontSize: 20,
                fontFamily: 'Raleway',
                text: 'Sair',
                color: AppColors.blue,
                align: TextAlign.center,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(user: user),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
