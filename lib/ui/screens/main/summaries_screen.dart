import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';

class SummariesScreen extends StatefulWidget {
  const SummariesScreen({Key? key}) : super(key: key);

  @override
  _SummariesScreenState createState() => _SummariesScreenState();
}

class _SummariesScreenState extends State<SummariesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: _buildbody(),
    );
  }

  _buildAppBar() {
    return AppAppBar(
      title: "Nome do Conteudo",
      size: MediaQuery.of(context).size,
    );
  }

  _buildbody() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            _buildTopicos(
              title: 'Tópico do assunto',
              text:
                  "resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo",
            ),
            _buildTopicos(
              title: ' Outro tópico do assunto',
              text:
                  "resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo resumo",
            ),
          ],
        ),
      ),
    );
  }

  _buildTopicos({required title, required text}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 30,
              fontFamily: "Releway-Bold",
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontFamily: "Releway-Bold",
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
