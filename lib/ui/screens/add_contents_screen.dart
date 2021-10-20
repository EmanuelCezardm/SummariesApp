import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/data/dao/contentsdao.dart';
import 'package:summaries_app/domain/model/contents_model.dart';
import 'package:summaries_app/domain/model/subjects_model.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class AddContentsScreen extends StatefulWidget {
  final SubjectsModel subject;

  const AddContentsScreen({
    required this.subject,
    Key? key,
  }) : super(key: key);

  @override
  _AddContentsScreenState createState() => _AddContentsScreenState();
}

class _AddContentsScreenState extends State<AddContentsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(''),
      body: _buildBody(),
      backgroundColor: AppColors.blue,
    );
  }

  _buildAppBar(String title) {
    return AppAppBar(
      title: title,
      size: MediaQuery.of(context).size,
    );
  }

  _buildBody() {
    return ListView(
      children: [
        const AppText(
          text: 'Add Assuntos',
          color: AppColors.white,
          fontSize: 36,
          align: TextAlign.center,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(8, 64, 8, 0),
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
              labelText: 'Nome da matéria',
              labelStyle: TextStyle(
                fontSize: 28,
                color: AppColors.blue,
              ),
            ),
            initialValue: widget.subject.nameSubjects,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            enabled: false,
            decoration: const InputDecoration(
              disabledBorder: InputBorder.none,
              labelText: 'ID da matéria',
              labelStyle: TextStyle(
                fontSize: 28,
                color: AppColors.blue,
              ),
            ),
            initialValue: widget.subject.idSubject.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          TextFormField(
            controller: _nameController,
            validator: _nameValidator,
            decoration: const InputDecoration(
              labelText: 'Nome do assunto',
              labelStyle: TextStyle(
                fontSize: 28,
                color: AppColors.blue,
              ),
            ),
            style: const TextStyle(
              fontSize: 20,
            ),
            keyboardType: TextInputType.name,
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
            onPressed: _add,
            style: ElevatedButton.styleFrom(
              primary: AppColors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              "ADICIONAR",
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
    if (value == null || value.isEmpty) {
      return 'O campo é obrigatório!';
    }
    return null;
  }

  _add() async {
    if (!_formKey.currentState!.validate()) return;
    final String nameContent = _nameController.text;
    final int idSubject = widget.subject.idSubject;

    final ContentsModel content = ContentsModel(nameContent, idSubject);

    final controller = await ContentsDao().fetchContentsByName(nameContent);

    if (controller.isEmpty) {
      await ContentsDao().addContent(content);
      _functionContinue(context, 'Assunto salvo com sucesso.');
    } else {
      _functionContinue(context, 'Assunto já registrado.');
    }
  }

  _functionContinue(context, text) {
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
              },
            ),
          ],
        );
      },
    );
  }
}
