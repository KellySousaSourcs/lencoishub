import 'package:flutter/material.dart';

class PerfilDesenvolvedoraPage extends StatelessWidget {
  const PerfilDesenvolvedoraPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Pegamos as dimensões da tela para cálculos proporcionais
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    // Caminho da sua imagem (usando a mesma background.png)
    const String imagePath = "assets/images/background.png";

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // --- BLOCO 1 (TOP): DESIGN DE REVISTA SOBREPOSTO (STACK) ---
          // Usamos Expanded(flex: 7) para garantir que o Stack ocupe 70% da altura disponível
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                // 1. Título Grande "HI, I'M LAILA" (Serifado)
                Positioned(
                  top: screenHeight * 0.08, // Começa a 8% do topo da tela
                  left: screenWidth * 0.05, // Começa a 5% da largura da tela
                  child: Text(
                    "HI, I'M LAILA",
                    style: TextStyle(
                      fontFamily: 'Serif', // Troque para Playfair Display se tiver
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.2,
                      color: Colors.black,
                    ),
                  ),
                ),

                // 2. Foto Principal (Retrato Central e Grande)
                Positioned(
                  top: screenHeight * 0.15, // Posicionamento proporcional
                  left: screenWidth * 0.2, 
                  right: screenWidth * 0.1,
                  bottom: screenHeight * 0.02, // Margem inferior para o texto respirar
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // 3. Foto Secundária (Pequena sobreposta à esquerda na borda)
                Positioned(
                  top: screenHeight * 0.3, // Posicionada para cruzar a foto principal
                  left: screenWidth * 0.04,
                  child: Container(
                    width: screenWidth * 0.28, // Largura proporcional (28% da tela)
                    height: screenHeight * 0.18, // Altura proporcional
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4), // Borda branca chic
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5))
                      ],
                      image: const DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // 4. Caixa de Texto Code Bloom (Sobreposta à direita)
                Positioned(
                  top: screenHeight * 0.22, // Posicionamento proporcional
                  right: screenWidth * 0.03,
                  child: Container(
                    width: screenWidth * 0.42, // Ocupa 42% da largura
                    padding: const EdgeInsets.all(12),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Code Bloom", 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 5),
                        const Text(
                          "Transformando ideias em código e florescendo soluções digitais.",
                          style: TextStyle(fontSize: 11, color: Colors.black87, height: 1.3),
                        ),
                      ],
                    ),
                  ),
                ),

                // Botão Voltar (Seta Preta)
                Positioned(
                  top: screenHeight * 0.06, // Abaixo da status bar
                  left: screenWidth * 0.02,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),

          // --- BLOCO 2 (MEIO): FRASE CURTA E LIMPA (SEM SOBREPOSIÇÃO) ---
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            color: Colors.white,
            child: const Text(
              "This is a space dedicated to elevating your everyday. To help you elevate your home, your space, your closet, your skin...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.1, color: Colors.black87),
            ),
          ),

          // --- BLOCO 3 (BASE): BLOCO PRETO + FOTO RETRATO (ROW SIDE-BY-SIDE) ---
          // Usamos Expanded(flex: 3) para garantir que este bloco ocupe o restante da altura (30%)
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Lado Esquerdo: Bloco Preto com Informações e Contatos
                Expanded(
                  flex: 6, // Ocupa 6/10 da largura
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente
                      children: [
                        const Text("CONTACT", 
                          style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        const Text("bloomcde@gmail.com", 
                          style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4)),
                        const Text("+55 (98) 99119-0966", 
                          style: TextStyle(color: Colors.white70, fontSize: 12)),
                        const SizedBox(height: 18),
                        const Text("LENÇÓIS HUB", 
                          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: -0.5)),
                        const SizedBox(height: 6),
                        const Text(
                          "O Lençóis Hub nasceu para conectar turistas às belezas de Barreirinhas.",
                          style: TextStyle(color: Colors.grey, fontSize: 11, height: 1.4),
                        ),
                      ],
                    ),
                  ),
                ),
                // Lado Direito: Imagem em Modo Retrato
                Expanded(
                  flex: 4, // Ocupa 4/10 da largura
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}