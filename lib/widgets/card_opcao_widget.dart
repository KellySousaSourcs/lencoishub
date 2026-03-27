import 'package:flutter/material.dart';

class CardOpcaoWidget extends StatelessWidget {
  final String titulo;
  final String imagem;
  final List<String> tags;
  final VoidCallback aoClicar;
  final bool temPlay;

  const CardOpcaoWidget({
    super.key,
    required this.titulo,
    required this.imagem,
    required this.tags,
    required this.aoClicar,
    this.temPlay = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoClicar,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        height: 120, // Altura ajustada para o formato da imagem
        decoration: BoxDecoration(
          color: const Color(0xFF0083B0), // O azul exato da sua imagem
          borderRadius: BorderRadius.circular(25), // Faz o formato de pílula
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // LADO ESQUERDO: Imagem oval cortada com borda branca
            Container(
              width: 140,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(80),
                ),
                image: DecorationImage(
                  image: AssetImage(imagem),
                  fit: BoxFit.cover,
                ),
              ),
              child: temPlay 
                ? const Center(child: Icon(Icons.play_circle_outline, color: Colors.white, size: 50)) 
                : null,
            ),
            
            const SizedBox(width: 15),

            // LADO DIREITO: Textos e Tags
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Gera as tags com ícones igual na foto
                  ...tags.map((tag) => Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      children: [
                        const Icon(Icons.spa_outlined, color: Colors.white, size: 14), // Ícone estilo folha/natureza
                        const SizedBox(width: 8),
                        Text(
                          tag,
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}