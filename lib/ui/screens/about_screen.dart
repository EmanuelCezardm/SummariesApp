import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<AboutScreen> {
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
      title: "Sobre",
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
              title: 'Termos de uso',
              text:
                  "Estes Termos de Uso governam seu uso do SummariesApp, exceto quando afirmamos explicitamente que outros termos se aplicam e fornecem informações sobre o Serviço do SummariesApp. Quando você cria uma conta do SummariesApp ou usa o SummariesApp, concorda com estes termos.",
            ),
            _buildTopicos(
              title: 'Sobre o aplicativo',
              text:
                  "Concordamos em fornecer a você o Serviço do SummariesApp. O Serviço inclui todos os produtos, recursos, serviços, tecnologias e software do SummariesApp que fornecemos para promover  a missão dele: fornecer os melhores resumos, de maneira gratuita, de disciplinas importantes para Ensino Fundamental II, Ensino Médio e/ou Vestibulares. Assim, você otimizará o tempo com os estudos, através do resumos,  e obterá maior praticidade.",
            ),
            _buildTopicos(
              title: 'Quem pode usar',
              text:
                  "Queremos que nosso serviço seja o mais aberto e inclusivo possível. Portanto, alunos com 10 anos ou mais podem acessar nosso aplicativo.",
            ),
            _buildTopicos(
              title: 'Sobre os desenvolvedores',
              text:
                  "O aplicativo foi desenvolvido pelos alunos do INSTITUTO FEDERAL DE ALAGOAS - Campus Arapiraca, com a orientação do aluno Emanuel Cézar e a supervisão do professor Tarsis Marinho.",
            ),
            _buildTopicoDesenvolvedores(title: 'Desenvolvedores:'),
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

  _buildTopicoDesenvolvedores({required title}) {
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
        const SizedBox(height: 16),
        SizedBox(
          child: _buildTextNomeCriadores(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  _buildTextNomeCriadores() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          _buildNomeDesenvolvedores("Angelina Oliveira"),
          _buildNomeDesenvolvedores("Emanuel Cézar"),
          _buildNomeDesenvolvedores("Emanuelly Vitória"),
          _buildNomeDesenvolvedores("Kailane Calixto"),
          _buildNomeDesenvolvedores("Laryssa Maria"),
          _buildNomeDesenvolvedores("Taymara Morais"),
        ],
      ),
    );
  }

  _buildNomeDesenvolvedores(String text) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: Colors.grey[800],
          size: 7,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontFamily: "Releway-Bold",
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
