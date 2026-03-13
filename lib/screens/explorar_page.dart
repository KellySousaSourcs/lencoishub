import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lencois_hub/widgets/fatia_animada_widget.dart';

class ExplorarPage extends StatefulWidget {
  const ExplorarPage({super.key});

  @override
  State<ExplorarPage> createState() => _ExplorarPageState();
}

class _ExplorarPageState extends State<ExplorarPage> {
  // 1. O índice que diz qual nome mostrar agora (0 = Balneário, 1 = Lagoas...)
  int _indiceDestinoAtual = 0;
  Timer? _timerTrocaNome;

  // 2. A sua LISTA MESTRA (Lista de Grupos)
  final List<List<DadosDaFatia>> _todosOsDestinos = [
    // GRUPO 0: BALNEÁRIO
    [
      DadosDaFatia(letra: "B", imagens: ["assets/images/explorar/b1.png", "assets/images/explorar/b3.png", "assets/images/explorar/b2.png"]),
      DadosDaFatia(letra: "A", imagens: ["assets/images/explorar/b2.png", "assets/images/explorar/bb4.png", "assets/images/explorar/b3.png"]),
      DadosDaFatia(letra: "L", imagens: ["assets/images/explorar/bb1.png", "assets/images/explorar/bb3.png", "assets/images/explorar/bb5.png"]),
      DadosDaFatia(letra: "N", imagens: ["assets/images/explorar/bb5.png", "assets/images/explorar/b3.png", "assets/images/explorar/b2.png"]),
      DadosDaFatia(letra: "E", imagens: ["assets/images/explorar/bb3.png", "assets/images/explorar/b3.png", "assets/images/explorar/b2.png"]),
      DadosDaFatia(letra: "Á", imagens: ["assets/images/explorar/bb4.png", "assets/images/explorar/b2.png", "assets/images/explorar/b2.png"]),
      DadosDaFatia(letra: "R", imagens: ["assets/images/explorar/bb6.png", "assets/images/explorar/bb6.png", "assets/images/explorar/b2.png"]),
      DadosDaFatia(letra: "I", imagens: ["assets/images/explorar/bb2.png", "assets/images/explorar/bb3.png", "assets/images/explorar/b2.png"]),
      DadosDaFatia(letra: "O", imagens: ["assets/images/explorar/b1.png", "assets/images/explorar/bb3.png", "assets/images/explorar/b2.png"]),
    ],
    // GRUPO 1: LAGOAS (Exemplo de como você adicionaria outro nome)
    [
      DadosDaFatia(letra: "L", imagens: ["assets/images/explorar/bb1.png", "assets/images/explorar/bb2.png", "assets/images/explorar/bb3.png"]),
      DadosDaFatia(letra: "A", imagens: ["assets/images/explorar/b1.png", "assets/images/explorar/b2.png", "assets/images/explorar/b3.png"]),
      DadosDaFatia(letra: "G", imagens: ["assets/images/explorar/bb4.png", "assets/images/explorar/bb5.png", "assets/images/explorar/bb6.png"]),
      DadosDaFatia(letra: "O", imagens: ["assets/images/explorar/b1.png", "assets/images/explorar/b2.png", "assets/images/explorar/b3.png"]),
      DadosDaFatia(letra: "A", imagens: ["assets/images/explorar/bb1.png", "assets/images/explorar/bb2.png", "assets/images/explorar/bb3.png"]),
      DadosDaFatia(letra: "S", imagens: ["assets/images/explorar/b1.png", "assets/images/explorar/b2.png", "assets/images/explorar/b3.png"]),
    ],
  ];

  @override
  void initState() {
    super.initState();
    // Muda o nome (o grupo todo) a cada 8 segundos
    _timerTrocaNome = Timer.periodic(const Duration(seconds: 8), (timer) {
      setState(() {
        _indiceDestinoAtual = (_indiceDestinoAtual + 1) % _todosOsDestinos.length;
      });
    });
  }

  @override
  void dispose() {
    _timerTrocaNome?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Pegamos apenas o grupo de fatias que deve aparecer agora
    final List<DadosDaFatia> fatiasAtuais = _todosOsDestinos[_indiceDestinoAtual];

    return Scaffold(
      appBar: AppBar(title: const Text("Explore nossa cidade!")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 450,
            child: Row(
              children: fatiasAtuais.map((item) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    // O 'ValueKey' é o segredo para o Flutter resetar o widget quando o nome mudar!
                    child: FatiaAnimadaWidget(
                      key: ValueKey("${item.letra}$_indiceDestinoAtual"), 
                      dados: item
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}