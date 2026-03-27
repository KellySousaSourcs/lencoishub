import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importante para o mapa
import '../utils/translations.dart';

class UniversalDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const UniversalDetailsScreen({super.key, required this.data});

  // Função para abrir o mapa nativo do celular (Google Maps ou Apple Maps)
  Future<void> _abrirMapa(String local) async {
  // Criamos um link de busca baseado no nome do local
  final String query = Uri.encodeComponent(local);
  final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$query");

  if (await canLaunchUrl(googleMapsUrl)) {
    await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
  } else {
    // Se não conseguir abrir o app de mapas, tenta abrir no navegador
    print("Erro ao abrir o app de mapas, tentando navegador...");
    await launchUrl(googleMapsUrl);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem de Destaque
            Image.asset(
              data['image'],
              width: double.infinity,
              height: 450,
              fit: BoxFit.cover,
            ),
            
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título e Categoria
                  Text(
                    data['title'],
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    Translator.t(data['category']),
                    style: const TextStyle(color: Color(0xff019879), fontWeight: FontWeight.w600),
                  ),
                  
                  const Divider(height: 40),

                  Text(
                    Translator.t('description_label'), // Adicione "Descrição" no translations
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    Translator.t(data['description']), 
                    style: const TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                  ),

                  const SizedBox(height: 40),

                  // Botão de Localização (Abre o Mapa Nativo)
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () => _abrirMapa(data['location']),
                      icon: const Icon(Icons.location_on),
                      label: Text(Translator.t('view_on_map')),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff019879),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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