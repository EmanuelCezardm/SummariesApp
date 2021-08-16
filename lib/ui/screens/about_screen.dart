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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(child: _buildbody(size)),
    );
  }

  _buildAppBar() {
    return AppAppBar(
      title: "Sobre",
      size: MediaQuery.of(context).size,
      subjectScreen: false,
    );
  }

  _buildbody(size) {
    return Container(
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.only(left: 15, top: 20, right: 15),
      //padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          _buildTitleTermosDeUso(),
          SizedBox(
            height: 10,
          ),
          _buildTextTermosDeUso(),
          SizedBox(
            height: 40,
          ),
          _buildTitleSobreAplicativo(),
          SizedBox(
            height: 10,
          ),
          _buildTextSobreAplicativo(),
          SizedBox(
            height: 40,
          ),
          _buildTitleQuemPodeAcessarApp(),
          SizedBox(
            height: 10,
          ),
          _buildTextQuemPodeAcessarApp(),
          SizedBox(
            height: 40,
          ),
          _buildTitleSobreOsCriadores(),
          SizedBox(
            height: 10,
          ),
          _buildTextSobreOsCriadores(),
          SizedBox(
            height: 40,
          ),
          _buildTitleNomeAlunos(),
          SizedBox(
            height: 10,
          ),
          _buildTextNomeCriadores(),
        ],
      ),
    );
  }

  _buildTitleTermosDeUso() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Termos de uso',
        style: TextStyle(
            color: Colors.grey[800], fontSize: 30, fontFamily: "Releway-Bold"),
      ),
    );
  }

  _buildTitleSobreAplicativo() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Sobre o aplicativo',
        style: TextStyle(
            color: Colors.grey[800], fontSize: 30, fontFamily: "Releway-Bold"),
      ),
    );
  }

  _buildTitleQuemPodeAcessarApp() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Quem pode usar o Summaries',
        style: TextStyle(
            color: Colors.grey[800], fontSize: 30, fontFamily: "Releway-Bold"),
      ),
    );
  }

  _buildTitleSobreOsCriadores() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Sobre os desenvolvedores',
        style: TextStyle(
            color: Colors.grey[800], fontSize: 30, fontFamily: "Releway-Bold"),
      ),
    );
  }

  _buildTitleNomeAlunos() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Nomes dos desenvoldedores:',
        style: TextStyle(
            color: Colors.grey[800], fontSize: 30, fontFamily: "Releway-Bold"),
      ),
    );
  }

  _buildTextTermosDeUso() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Estes Termos de Uso governam seu uso do SummariesApp, exceto quando afirmamos explicitamente que outros termos se aplicam e fornecem informações sobre o Serviço do SummariesApp. Quando você cria uma conta do SummariesApp ou usa o SummariesApp, concorda com estes termos.",
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: Colors.grey[700], fontSize: 16, fontFamily: "Releway-Bold"),
      ),
    );
  }

  _buildTextSobreAplicativo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Concordamos em fornecer a você o Serviço do SummariesApp. O Serviço inclui todos os produtos, recursos, serviços, tecnologias e software do SummariesApp que fornecemos para promover  a missão dele: fornecer os melhores resumos, de maneira gratuita, de disciplinas importantes para Ensino Fundamental II, Ensino Médio e/ou Vestibulares. Assim, você otimizará o tempo com os estudos, através do resumos,  e obterá maior praticidade.",
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: Colors.grey[700], fontSize: 16, fontFamily: "Releway-Bold"),
      ),
    );
  }

  _buildTextQuemPodeAcessarApp() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Queremos que nosso serviço seja o mais aberto e inclusivo possível. Portanto, alunos com 10 anos ou mais podem acessar nosso aplicativo.",
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: Colors.grey[700], fontSize: 16, fontFamily: "Releway-Bold"),
      ),
    );
  }

  _buildTextSobreOsCriadores() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "O aplicativo foi desenvolvido pelos alunos do INSTITUTO FEDERAL DE ALAGOAS - Campus Arapiraca, com a orientação do aluno Emanuel Cézar e a supervisão do professor Tarsis Marinho.",
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: Colors.grey[700], fontSize: 16, fontFamily: "Releway-Bold"),
      ),
    );
  }

  _buildTextNomeCriadores() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildNome1(),
          SizedBox(height: 5),
          _buildNome2(),
          SizedBox(height: 5),
          _buildNome3(),
          SizedBox(height: 5),
          _buildNome4(),
          SizedBox(height: 5),
          _buildNome5(),
          SizedBox(height: 5),
          _buildNome6(),
        ],
      ),
    );
  }

  _buildNome1() {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: Colors.grey[800],
          size: 7,
        ),
        SizedBox(width: 5),
        Text(
          "Angelina Oliveira",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontFamily: "Releway-Bold"),
        ),
      ],
    );
  }

  _buildNome2() {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: Colors.grey[800],
          size: 7,
        ),
        SizedBox(width: 5),
        Text(
          "Emanuel Cézar",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontFamily: "Releway-Bold"),
        ),
      ],
    );
  }

  _buildNome3() {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: Colors.grey[800],
          size: 7,
        ),
        SizedBox(width: 5),
        Text(
          "Emanuelly Vitória",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontFamily: "Releway-Bold"),
        ),
      ],
    );
  }

  _buildNome4() {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: Colors.grey[800],
          size: 7,
        ),
        SizedBox(width: 5),
        Text(
          "Kailane Calixto",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontFamily: "Releway-Bold"),
        ),
      ],
    );
  }

  _buildNome5() {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: Colors.grey[800],
          size: 7,
        ),
        SizedBox(width: 5),
        Text(
          "Laryssa Maria",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontFamily: "Releway-Bold"),
        ),
      ],
    );
  }

  _buildNome6() {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: Colors.grey[800],
          size: 7,
        ),
        SizedBox(width: 5),
        Text(
          "Taymara Morais",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
              fontFamily: "Releway-Bold"),
        ),
      ],
    );
  }
}
