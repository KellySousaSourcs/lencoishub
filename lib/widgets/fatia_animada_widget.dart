import 'dart:async';
import 'package:flutter/material.dart';

// Este é o modelo de dados para facilitar
class DadosDaFatia {
  final String letra;
  final List<String> imagens; // Lista com os 3 caminhos das fotos

  DadosDaFatia({required this.letra, required this.imagens});
}

class FatiaAnimadaWidget extends StatefulWidget {
  final DadosDaFatia dados;

  const FatiaAnimadaWidget({super.key, required this.dados});

  @override
  State<FatiaAnimadaWidget> createState() => _FatiaAnimadaWidgetState();
}

class _FatiaAnimadaWidgetState extends State<FatiaAnimadaWidget> {
  int _indiceAtual = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Inicia o contador interno de cada quadradinho
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          _indiceAtual = (_indiceAtual + 1) % widget.dados.imagens.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Troca a imagem com efeito de fade
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          child: Container(
            key: ValueKey(widget.dados.imagens[_indiceAtual]),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(widget.dados.imagens[_indiceAtual]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // A letra por cima da imagem
        Text(
          widget.dados.letra,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(blurRadius: 10, color: Colors.black)],
          ),
        ),
      ],
    );
  }
}