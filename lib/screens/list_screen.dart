import 'package:flutter/material.dart';
import 'package:lencois_hub/screens/category_details_screen.dart';
import 'package:lencois_hub/utils/translations.dart';
import 'package:lencois_hub/widgets/place_list_item.dart';


class ListScreen extends StatelessWidget {
  final String categoriaTitulo;
  final List<Map<String, dynamic>> dadosDaCategoria;

  const ListScreen({
    super.key,
    required this.categoriaTitulo,
    required this.dadosDaCategoria,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translator.t(categoriaTitulo)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dadosDaCategoria.length,
        itemBuilder: (context, index) {
          final Map<String, dynamic> local = dadosDaCategoria[index];
          return PlaceListItem(
            name: local['name'],
            image: local['mainImage'],
            rating: local['rating'],
            subtitle: Translator.t(local['descriptionKey']),
            onTap: () {
             
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetailsScreen(local: local),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
