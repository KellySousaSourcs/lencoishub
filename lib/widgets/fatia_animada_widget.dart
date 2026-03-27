import 'dart:async';
import 'package:flutter/material.dart';

class DadosDaFatia {
  final String letra;
  final List<String> imagens;

  DadosDaFatia({required this.letra, required this.imagens});
}

class FatiaAnimadaWidget extends StatefulWidget {
  final DadosDaFatia dados;
  final bool isPrimeira; // Nova propriedade
  final bool isUltima;   // Nova propriedade

  const FatiaAnimadaWidget({
    super.key, 
    required this.dados, 
    this.isPrimeira = false, 
    this.isUltima = false
  });

  @override
  State<FatiaAnimadaWidget> createState() => _FatiaAnimadaWidgetState();
}

class _FatiaAnimadaWidgetState extends State<FatiaAnimadaWidget> {
  int _indiceAtual = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
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
    // Lógica das bordas: Arredonda apenas os cantos externos do grupo
    BorderRadius borderRadiusFatia = BorderRadius.zero;
    if (widget.isPrimeira) {
      borderRadiusFatia = const BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      );
    } else if (widget.isUltima) {
      borderRadiusFatia = const BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          child: Container(
            key: ValueKey(widget.dados.imagens[_indiceAtual]),
            decoration: BoxDecoration(
              borderRadius: borderRadiusFatia, // Aplica a borda calculada
              image: DecorationImage(
                image: AssetImage(widget.dados.imagens[_indiceAtual]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
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