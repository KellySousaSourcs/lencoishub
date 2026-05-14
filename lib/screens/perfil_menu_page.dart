import 'package:flutter/material.dart';
import 'package:lencois_hub/screens/language_screen.dart';
import 'package:lencois_hub/screens/perfil_desenvolvedora_page.dart';


class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Definindo a cor azul dos botões conforme seu design
    const Color azulBotoes = Color(0xFF0083B0);

    return Scaffold(
      body: Stack(
        children: [
          // 1. IMAGEM DE FUNDO (Dunas e Lagoa)
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45, // Ocupa quase metade do topo
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/explorar/b1.png"), 
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. BOTÃO VOLTAR (Seta Branca)
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
            ),
          ),

          // 3. O CONTAINER BRANCO (Card de Opções)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.68, // Altura do card branco
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 1),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  // BOTÃO 1: IDIOMAS
                  _buildBotaoPerfil(
                    label: "Idiomas",
                    icon: Icons.g_translate,
                    cor: azulBotoes,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LanguageScreen()),
                      );
                    },
                  ),

                  const SizedBox(height: 15),

                  // BOTÃO 2: CONTATOS (Sobre Você)
                  _buildBotaoPerfil(
                    label: "Contatos",
                    icon: Icons.account_circle_outlined,
                    cor: azulBotoes,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PerfilDesenvolvedoraPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET AUXILIAR PARA CRIAR OS BOTÕES ESTILO PÍLULA
  Widget _buildBotaoPerfil({
    required String label,
    required IconData icon,
    required Color cor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 15),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}