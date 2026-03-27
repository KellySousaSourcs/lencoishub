import 'package:flutter/material.dart';
import 'package:lencois_hub/utils/translations.dart';
import 'package:lencois_hub/widgets/card_video_depoimento_widget.dart';
import 'package:lencois_hub/screens/video_local_page.dart';

class DepoimentosPage extends StatelessWidget {
  const DepoimentosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. A LISTA DE DADOS (4 Idiomas)
    final List<Map<String, dynamic>> depoimentosPorIdioma = [
      {
        'idioma': 'Português 🇧🇷',
        'videos': [
          {
            'nome': 'Mariana - RJ',
            'video': 'assets/video/historia.mp4',
            'capa': 'assets/images/explorar/b1.png',
            'tags': ['Paraíso natural', 'Relaxante', 'Aventura'],
          },
          {
            'nome': 'Carlos - SP',
            'video': 'assets/video/pt2.mp4',
            'capa': 'assets/images/explorar/b2.png',
            'tags': ['Família', 'Seguro', 'Lindo'],
          },
        ],
      },
      {
        'idioma': 'English 🇺🇸',
        'videos': [
          {
            'nome': 'John - USA',
            'video': 'assets/video/en1.mp4',
            'capa': 'assets/images/explorar/bb1.png',
            'tags': ['Amazing', 'Wild', 'Sun'],
          },
        ],
      },
      {
        'idioma': '한국어 🇰🇷',
        'videos': [
          {
            'nome': 'Min-jun - Seoul',
            'video': 'assets/video/kr1.mp4',
            'capa': 'assets/images/explorar/bb2.png',
            'tags': ['최고의 여행', '자연', '추천'],
          },
        ],
      },
      {
        'idioma': 'Español 🇪🇸',
        'videos': [
          {
            'nome': 'Karol G - Colômbia',
            'video': 'assets/video/es1.mp4',
            'capa': 'assets/images/explorar/b3.png',
            'tags': ['Increíble', 'Aventura', 'Sol'],
          },
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
         Translator.t("cat_sub_title"),
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0083B0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: depoimentosPorIdioma.length,
        itemBuilder: (context, index) {
          final categoria = depoimentosPorIdioma[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título do Idioma (Ex: Português 🇧🇷)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  categoria['idioma'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
              ),

              // Lista de Cards de Vídeo para este idioma
              ...categoria['videos'].map((video) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: CardVideoDepoimentoWidget(
                    nome: video['nome'],
                    imagem: video['capa'],
                    tags: List<String>.from(video['tags']),
                    aoClicar: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoLocalPage(
                            caminhoVideo: video['video'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}