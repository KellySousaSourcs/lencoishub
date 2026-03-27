import 'package:flutter/material.dart';
// Certifique-se de que os caminhos dos imports abaixo estão corretos no seu projeto
import 'package:lencois_hub/widgets/card_video_depoimento_widget.dart';
import 'package:lencois_hub/screens/video_local_page.dart';

class DestinoVideoPage extends StatelessWidget {
  const DestinoVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // A LISTA DE DADOS QUE SERÁ IMPRIMIDA (Você pode adicionar ou remover vídeos aqui)
    final List<Map<String, dynamic>> meusVideos = [
      {
        'nome': 'Passeio nos Pequenos Lençóis',
        'video': 'assets/video/passeio1.mp4',
        'capa': 'assets/images/explorar/b1.png',
        'tags': ['Aventura', 'Dunas'],
      },
      {
        'nome': 'Pôr do Sol na Lagoa Azul',
        'video': 'assets/video/lagoa_azul.mp4',
        'capa': 'assets/images/explorar/b2.png',
        'tags': ['Relaxante', 'Pôr do Sol'],
      },
      {
        'nome': 'Banho no Rio Preguiças',
        'video': 'assets/video/rio.mp4',
        'capa': 'assets/images/explorar/b3.png',
        'tags': ['Natureza', 'Rio',],
      },
      {
        'nome': 'Sobrevoo nos Lençóis',
        'video': 'assets/video/voo.mp4',
        'capa': 'assets/images/explorar/bb1.png',
        'tags': ['Aérea', 'Inesquecível'],
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Explorar Destinos", // Ou use Translator.t("cat_subtitle")
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // O ListView.builder vai "imprimir" a lista acima usando seu Widget pronto
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: meusVideos.length,
        itemBuilder: (context, index) {
          final videoData = meusVideos[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: CardVideoDepoimentoWidget(
              nome: videoData['nome'],
              imagem: videoData['capa'],
              tags: List<String>.from(videoData['tags']),
              aoClicar: () {
                // Ao clicar no Card, abre o player de vídeo que você já tem
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoLocalPage(
                      caminhoVideo: videoData['video'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}