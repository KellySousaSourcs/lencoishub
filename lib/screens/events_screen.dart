import 'package:flutter/material.dart';
import 'package:lencois_hub/events_data.dart';
import '../widgets/event_card.dart'; // Onde está a listaEventos
import '../utils/translations.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  // Começamos com Junho, que é o mês forte da cultura em Barreirinhas
  String mesSelecionado = 'Mar';

  @override
  Widget build(BuildContext context) {
    // Filtramos a lista de dados para mostrar apenas o mês clicado
    final eventosExibidos = listaEventos
        .where((e) => e['month'] == mesSelecionado)
        .toList();

    return Scaffold(
      backgroundColor: const Color(
        0xFFFDFDF7,
      ), // Um fundo quase branco, combinando com o bege
      appBar: AppBar(
        title: Text(
          Translator.t('events_title'),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // SELETOR DE MESES (As "bolinhas" do topo)
          SizedBox(
            height: 38,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children:
                  [
                    'Jan',
                    'Fev',
                    'Mar',
                    'Mai',
                    'Jun',
                    'Jul',
                    'Ago',
                    'Set',
                    'Out',
                    'Nov',
                    'Dez',
                  ].map((mes) {
                    bool estaSelecionado = mes == mesSelecionado;
                    return GestureDetector(
                      onTap: () => setState(() => mesSelecionado = mes),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: estaSelecionado
                              ? const Color(0xff019879)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xff019879),
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          mes,
                          style: TextStyle(
                            color: estaSelecionado
                                ? Colors.white
                                : const Color(0xff019879),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),

          const SizedBox(height: 10),

          // LISTA DINÂMICA DE EVENTOS
          Expanded(
            child: eventosExibidos.isEmpty
                ? const Center(child: Text("Nenhum evento oficial neste mês."))
                : ListView.builder(
                    itemCount: eventosExibidos.length,
                    itemBuilder: (context, index) {
                      // Aqui usamos o seu componente reutilizável!
                      return EventCard(eventData: eventosExibidos[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
