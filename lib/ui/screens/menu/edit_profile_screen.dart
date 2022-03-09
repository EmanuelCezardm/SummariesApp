import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:summaries_app/data/dao/usersdao.dart';
import 'package:summaries_app/domain/model/user_model.dart';
import 'package:summaries_app/services/via_cep_service.dart';
import 'package:summaries_app/ui/screens/menu/profile_screen.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_cupertino_button.dart';
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
  var maskCEP = MaskTextInputFormatter(mask: "#####-###");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();

  UserModel get user => widget.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(""),
      body: _buildBody(),
      backgroundColor: AppColors.white,
    );
  }

  _buildAppBar(String title) {
    return AppAppBar(
      iconColor: AppColors.blue,
      onTapBack: () {
        Navigator.pop(context);
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
          const SizedBox(height: 8),
          TextFormField(
            enabled: false,
            decoration: const InputDecoration(
              disabledBorder: InputBorder.none,
              labelText: 'CEP Atual',
              labelStyle: TextStyle(
                fontSize: 28,
                color: AppColors.blue,
              ),
            ),
            initialValue: user.cep,
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
          TextFormField(
            controller: _cepController,
            validator: _cepValidator,
            decoration: const InputDecoration(
              labelText: 'Novo CEP',
              labelStyle: TextStyle(
                fontSize: 28,
                color: AppColors.blue,
              ),
            ),
            style: const TextStyle(
              fontSize: 20,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [maskCEP],
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

  String? _cepValidator(value) {
    if (value.length < 9 && value.isNotEmpty) {
      return 'Preencha o campo corretamente';
    }
    if (value == user.cep) {
      return 'Insira um CEP diferente do atual';
    }
    return null;
  }

  Future<bool> _cepConfirm(value) async {
    String cep = value.replaceAll('-', '');
    bool result = await ViaCepService.fetchCepToValidate(cep);

    if (result) {
      return true;
    }
    return false;
  }

  _editCEP() async {
    UserDao().updateCEP(user.email, _cepController.text);

    user.setCep(_cepController.text);
  }

  _editName() async {
    UserDao().updateName(user.email, _nameController.text);

    user.setName(_nameController.text);
  }

  _editPhone() async {
    UserDao().updateCellPhone(user.email, _phoneController.text);

    user.setCellPhone(_phoneController.text);
  }

  _createmensage(List<int> list) {
    if (list == []) {
      _functionShowDialog(context, 'Você não alterou nenhum valor', 0);
    }

    if (list.length == 1) {
      if (list[0] == 1) {
        _editCEP();
        _functionShowDialog(context, 'CEP alterado com sucesso', 1);
      } else if (list[0] == 2) {
        _editName();
        _functionShowDialog(context, 'Nome alterado com sucesso', 1);
      } else if (list[0] == 3) {
        _editPhone();
        _functionShowDialog(context, 'Telefone alterado com sucesso', 1);
      }
    }

    if (list.length == 2) {
      if (list[0] == 1 && list[1] == 2) {
        _editCEP();
        _editName();
        _functionShowDialog(context, 'Nome e CEP alterados com sucesso', 1);
      } else if (list[0] == 1 && list[1] == 3) {
        _editCEP();
        _editPhone();
        _functionShowDialog(context, 'Telefone e CEP alterados com sucesso', 1);
      } else if (list[0] == 2 && list[1] == 3) {
        _editName();
        _editPhone();
        _functionShowDialog(
            context, 'Nome e Telefone alterados com sucesso', 1);
      }
    }

    if (list.length == 3) {
      _editCEP();
      _editName();
      _editPhone();
      _functionShowDialog(
          context, 'Nome, Telefone e CEP alterados com sucesso', 1);
    }
  }

  _edit() async {
    List<int> list = [];
    if (!_formKey.currentState!.validate()) return;

    if (_cepController.text.isNotEmpty &&
        await _cepConfirm(_cepController.text)) {
      list.add(1);
    } else if (_cepController.text.isNotEmpty &&
        await _cepConfirm(_cepController.text) == false) {
      _functionShowDialog(context, 'CEP Inválido digite um CEP válido', 0);
      return;
    }

    if (_nameController.text.isNotEmpty) {
      list.add(2);
    }

    if (_phoneController.text.isNotEmpty) {
      list.add(3);
    }

    _createmensage(list);
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
          ),
          actions: [
            AppCupertinoButton(
              text: 'Fechar',
              onPressed: () {
                if (function == 0) {
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(user: user),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
