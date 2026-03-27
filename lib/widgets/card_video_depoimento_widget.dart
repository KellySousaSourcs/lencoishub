import 'package:flutter/material.dart';

class CardVideoDepoimentoWidget extends StatelessWidget {
  final String nome;
  final String imagem;
  final List<String> tags;
  final VoidCallback aoClicar;

  const CardVideoDepoimentoWidget({
    super.key,
    required this.nome,
    required this.imagem,
    required this.tags,
    required this.aoClicar,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoClicar,
      child: Container(
        height: 110, // Altura ajustada para caber as tags confortavelmente
        decoration: BoxDecoration(
          color: const Color(0xFF0083B0), // O azul padrão do seu app
          borderRadius: BorderRadius.circular(
            15,
          ), // Deixa as pontas totalmente redondas
        ),
        child: Row(
          children: [
            // ESQUERDA: Foto Circular com ícone de Play
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 115,
                    height: 110,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(80),
                      ),
                      image: DecorationImage(
                        image: AssetImage(imagem),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Icon(Icons.play_circle_fill, color: Colors.white, size: 45),
                ],
              ),
            ),

            const SizedBox(width: 15),

            // DIREITA: Nome e as Tags com ícones
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Loop para gerar as tags dinamicamente
                  ...tags.map(
                    (tag) => Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 14,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            tag,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
