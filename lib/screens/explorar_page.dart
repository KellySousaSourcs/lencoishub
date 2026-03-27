import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lencois_hub/screens/destino_video_page.dart';
import 'package:lencois_hub/utils/translations.dart';
import 'package:lencois_hub/widgets/card_opcao_widget.dart';
import 'package:lencois_hub/widgets/fatia_animada_widget.dart';
import 'package:lencois_hub/screens/depoimentos_page.dart';
import 'package:lencois_hub/screens/video_local_page.dart';
import 'package:lencois_hub/screens/contatos_page.dart';

class ExplorarPage extends StatefulWidget {
  const ExplorarPage({super.key});

  @override
  State<ExplorarPage> createState() => _ExplorarPageState();
}

class _ExplorarPageState extends State<ExplorarPage> {
  int _indiceDestinoAtual = 0;
  Timer? _timerTrocaNome;

  final List<List<DadosDaFatia>> _todosOsDestinos = [
    // GRUPO 0: BALNEÁRIO
    [
      DadosDaFatia(
        letra: "B",
        imagens: [
          "assets/images/explorar/b1.png",
          "assets/images/explorar/b3.png",
          "assets/images/explorar/b2.png",
        ],
      ),
      DadosDaFatia(
        letra: "A",
        imagens: [
          "assets/images/explorar/b2.png",
          "assets/images/explorar/bb4.png",
          "assets/images/explorar/b3.png",
        ],
      ),
      DadosDaFatia(
        letra: "L",
        imagens: [
          "assets/images/explorar/bb1.png",
          "assets/images/explorar/bb3.png",
          "assets/images/explorar/bb5.png",
        ],
      ),
      DadosDaFatia(
        letra: "N",
        imagens: [
          "assets/images/explorar/bb5.png",
          "assets/images/explorar/b3.png",
          "assets/images/explorar/b2.png",
        ],
      ),
      DadosDaFatia(
        letra: "E",
        imagens: [
          "assets/images/explorar/bb3.png",
          "assets/images/explorar/b3.png",
          "assets/images/explorar/b2.png",
        ],
      ),
      DadosDaFatia(
        letra: "Á",
        imagens: [
          "assets/images/explorar/bb4.png",
          "assets/images/explorar/b2.png",
          "assets/images/explorar/b2.png",
        ],
      ),
      DadosDaFatia(
        letra: "R",
        imagens: [
          "assets/images/explorar/bb6.png",
          "assets/images/explorar/bb6.png",
          "assets/images/explorar/b2.png",
        ],
      ),
      DadosDaFatia(
        letra: "I",
        imagens: [
          "assets/images/explorar/bb2.png",
          "assets/images/explorar/bb3.png",
          "assets/images/explorar/b2.png",
        ],
      ),
      DadosDaFatia(
        letra: "O",
        imagens: [
          "assets/images/explorar/b1.png",
          "assets/images/explorar/bb3.png",
          "assets/images/explorar/b2.png",
        ],
      ),
    ],
    // GRUPO 1: LAGOAS
    [
      DadosDaFatia(
        letra: "L",
        imagens: [
          "assets/images/explorar/bb1.png",
          "assets/images/explorar/bb2.png",
          "assets/images/explorar/bb3.png",
        ],
      ),
      DadosDaFatia(
        letra: "A",
        imagens: [
          "assets/images/explorar/b1.png",
          "assets/images/explorar/b2.png",
          "assets/images/explorar/b3.png",
        ],
      ),
      DadosDaFatia(
        letra: "G",
        imagens: [
          "assets/images/explorar/bb4.png",
          "assets/images/explorar/bb5.png",
          "assets/images/explorar/bb6.png",
        ],
      ),
      DadosDaFatia(
        letra: "O",
        imagens: [
          "assets/images/explorar/b1.png",
          "assets/images/explorar/b2.png",
          "assets/images/explorar/b3.png",
        ],
      ),
      DadosDaFatia(
        letra: "A",
        imagens: [
          "assets/images/explorar/bb1.png",
          "assets/images/explorar/bb2.png",
          "assets/images/explorar/bb3.png",
        ],
      ),
      DadosDaFatia(
        letra: "S",
        imagens: [
          "assets/images/explorar/b1.png",
          "assets/images/explorar/b2.png",
          "assets/images/explorar/b3.png",
        ],
      ),
    ],
  ];

  @override
  void initState() {
    super.initState();
    _timerTrocaNome = Timer.periodic(const Duration(seconds: 8), (timer) {
      if (mounted) {
        setState(() {
          _indiceDestinoAtual =
              (_indiceDestinoAtual + 1) % _todosOsDestinos.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timerTrocaNome?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<DadosDaFatia> fatiasAtuais =
        _todosOsDestinos[_indiceDestinoAtual];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Esta linha faz a mágica de voltar
          },
        ),
        title: Text(
          Translator.t("cat_subtitle"),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- SEÇÃO DAS FATIAS ANIMADAS CORRIGIDA ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GestureDetector(
                // 1. Envolvemos tudo com o GestureDetector
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DestinoVideoPage(),
                    ),
                  );
                },
                child: SizedBox(
                  height: 350,
                  // O behavior garante que o clique pegue até nos espaços vazios entre fatias
                  child: Row(
                    children: fatiasAtuais.asMap().entries.map((entry) {
                      int idx = entry.key;
                      DadosDaFatia item = entry.value;

                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: FatiaAnimadaWidget(
                            key: ValueKey("${item.letra}$_indiceDestinoAtual"),
                            dados: item,
                            isPrimeira: idx == 0,
                            isUltima: idx == fatiasAtuais.length - 1,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 4),

            // --- SEÇÃO DOS CARDS DE OPÇÕES (Mantida conforme solicitado) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CardOpcaoWidget(
                    titulo: "História de Barreirinhas",
                    imagem: "assets/images/explorar/b1.png",
                    temPlay: true,
                    tags: const ["Paraíso natural", "Relaxante", "Aventura"],
                    aoClicar: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoLocalPage(
                            caminhoVideo: "assets/video/historia.mp4",
                          ),
                        ),
                      );
                    },
                  ),
                  CardOpcaoWidget(
                    titulo: "Depoimentos de Turistas",
                    imagem: "assets/images/explorar/b2.png",
                    tags: const ["Paraíso natural", "Relaxante", "Aventura"],
                    aoClicar: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DepoimentosPage(),
                        ),
                      );
                    },
                  ),
                  CardOpcaoWidget(
                    titulo: "Contatos Emergências (SOS)",
                    imagem: "assets/images/explorar/b3.png",
                    tags: const ["Paraíso natural", "Relaxante", "Aventura"],
                    aoClicar: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContatosPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
