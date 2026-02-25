import 'package:flutter/material.dart';
import 'package:lencois_hub/utils/translations.dart';
import 'package:lencois_hub/widgets/main_action_button.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final String name;
  final String mainImage;
  final String description;
  final List<String> photos;
  final String openStatusKey;
  final String timeValue;
  final String mapTitleKey;

  const PlaceDetailsScreen({
    super.key,
    required this.name,
    required this.mainImage,
    required this.description,
    required this.photos,
    required this.openStatusKey,
    required this.timeValue,
    required this.mapTitleKey,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(mainImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _CircleButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  _CircleButton(
                    icon: Icons.favorite_border,
                    color: Color(0xffc4040f),
                    onTap: () {
                      print('Salvando clique!!');
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.58,
              width: 370,
              decoration: BoxDecoration(
                color: const Color(0xffDDEEEF),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        left: 18,
                        right: 18,
                        top: 22,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: Color(0xff019879),
                                size: 32,
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Translator.t(openStatusKey),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff534f4f),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    Translator.t(timeValue),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => Scaffold(
                                          backgroundColor: Colors.black,
                                          appBar: AppBar(
                                            backgroundColor: Colors.black,
                                            iconTheme: const IconThemeData(
                                              color: Colors.white,
                                            ),
                                          ),
                                          body: Center(
                                            child: Image.asset(photos[index]),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 100,
                                    margin: const EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage(photos[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: photos.length,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            mapTitleKey,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () async {
                              print('Abrindo Google Maps!!');
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.blue.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.blue.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      Translator.t('text_directions'),
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.open_in_new,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  MainActionButton(
                    label: "Entrar em contato",
                    onTap: () {
                      print('Entrar em contato clicado!!');
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
}

class _CircleButton extends StatelessWidget {
  final IconData icon; // Qual ícone vai aparecer
  final Color color; // A cor do ícone
  final VoidCallback onTap; // O que acontece ao clicar

  const _CircleButton({
    required this.icon,
    required this.onTap,
    this.color = Colors.black, // Se não passar cor, ele será preto
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white.withValues(
          alpha: 0.9,
        ), // Fundo branco meio transparente
        radius: 20, // Tamanho do círculo
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }
}
