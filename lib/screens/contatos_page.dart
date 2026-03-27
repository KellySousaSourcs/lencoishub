import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Necessário para copiar o texto

class ContatosPage extends StatelessWidget {
  const ContatosPage({super.key});

  // Função para copiar o número e mostrar um aviso na tela
  void _copiarNumero(BuildContext context, String numero, String nome) {
    Clipboard.setData(ClipboardData(text: numero));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Número do $nome copiado!"),
        backgroundColor: const Color(0xFF0083B0),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Contatos de Emergência", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0083B0),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Precisa de ajuda? Clique no card para copiar o número e ligar.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 25),

          // LISTA DE CONTATOS
          _buildCardContato(
            context,
            nome: "Polícia Militar",
            numero: "190",
            icone: Icons.local_police,
          ),
          _buildCardContato(
            context,
            nome: "SAMU",
            numero: "192",
            icone: Icons.medical_services,
          ),
          _buildCardContato(
            context,
            nome: "Bombeiros",
            numero: "193",
            icone: Icons.fire_truck,
          ),
          _buildCardContato(
            context,
            nome: "Delegacia de Turismo",
            numero: "(98) 91234-5678", // Número fictício de exemplo
            icone: Icons.support_agent,
          ),
          _buildCardContato(
            context,
            nome: "Hospital Municipal",
            numero: "(98) 3349-1234",
            icone: Icons.local_hospital,
          ),
        ],
      ),
    );
  }

  // Widget que cria cada linha de contato arredondada
  Widget _buildCardContato(BuildContext context, {required String nome, required String numero, required IconData icone}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF0083B0).withValues(alpha: 0.10),
          child: Icon(icone, color: const Color(0xFF0083B0)),
        ),
        title: Text(nome, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(numero),
        trailing: const Icon(Icons.copy, color: Colors.grey, size: 20),
        onTap: () => _copiarNumero(context, numero, nome),
      ),
    );
  }
}