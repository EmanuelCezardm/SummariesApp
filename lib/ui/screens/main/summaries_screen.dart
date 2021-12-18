import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class SummariesScreen extends StatefulWidget {
  final List<Map> resumo;

  const SummariesScreen({
    required this.resumo,
    Key? key,
  }) : super(key: key);

  @override
  _SummariesScreenState createState() => _SummariesScreenState();
}

class _SummariesScreenState extends State<SummariesScreen> {
  List<Map> get resumo => widget.resumo;

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
      title: resumo[0]['text'],
      size: MediaQuery.of(context).size,
    );
  }

  _buildbody() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      itemCount: resumo.length,
      itemBuilder: (context, index) {
        if (index != 0) {
          return _buildTopicos(resumo[index]['text'], resumo[index]['id_type']);
        }
        return const SizedBox(width: 1, height: 1);
      },
    );
  }

  _buildTopicos(String text, int id) {
    switch (id) {
      case 0:
        return _buildTitle(text);
      case 1:
        return _buildSubtitulo(text);
      case 2:
        return _buildParagrafo(text);
      case 3:
        return _buildTopico(text);
      case 4:
        return _buildSubtopico(text);
      case 5:
        return _buildFonte(text);
      case 6:
        return _buildExemplos(text);
    }
  }

  _buildTitle(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: text,
          fontSize: 22,
          fontFamily: "Releway-Bold",
          bold: true,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  _buildSubtitulo(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        AppText(
          text: text,
          fontSize: 18,
          fontFamily: "Releway-Bold",
          bold: true,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  _buildParagrafo(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: text,
          fontSize: 15,
          color: Colors.grey[800],
          fontFamily: "Releway-Bold",
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  _buildTopico(String text) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            const Icon(
              Icons.circle,
              color: AppColors.blue,
              size: 8,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: AppText(
                text: text,
                fontSize: 15,
                color: Colors.grey[800],
                fontFamily: "Releway-Bold",
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  _buildSubtopico(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 48),
            Expanded(
              child: AppText(
                text: text,
                fontSize: 13,
                color: Colors.grey[800],
                fontFamily: "Releway-Bold",
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  _buildFonte(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: text,
          fontSize: 11,
          color: Colors.grey[800],
          fontFamily: "Releway-Bold",
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  _buildExemplos(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 48),
            Expanded(
              child: AppText(
                text: text,
                fontSize: 13,
                color: Colors.grey[800],
                fontFamily: "Releway-Bold",
                bold: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
