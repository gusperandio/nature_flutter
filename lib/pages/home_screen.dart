import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natureatoz/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void stringsTrative() {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    var rng = Random();
    String wpp = '';
    switch (rng.nextInt(3)) {
      case 0:
        wpp = 'assets/wpp1.png';
        break;
      case 1:
        wpp = 'assets/wpp2.png';
        break;
      default:
        wpp = 'assets/wpp3.png';
        break;
    }

    final language = context.watch<LanguageProvider>().language == "En-US";
    final _texts = getLocalizedTexts(language);

    return Scaffold(
        body: Container(
      color: const Color(0xFFE6EFF8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                  image: DecorationImage(
                    image: AssetImage(wpp),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black.withOpacity(0.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _texts['title']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _texts['subTitle']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF2CB05),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      const Icon(
                        Icons.import_contacts,
                        size: 40,
                      ),
                      Text(_texts['card1']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF29F05),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      const Icon(
                        Icons.nature_people,
                        size: 40,
                      ),
                      Text(_texts['card2']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF28705),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      const Icon(
                        Icons.wallpaper,
                        size: 40,
                      ),
                      Text(_texts['card3']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 12.0, 12.0, 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _texts['Description']!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: 350,
            height: 280,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/dices.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _texts['exTitle1']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                _texts['exSubTitle1']!,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/atoz.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _texts['exTitle2']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                _texts['exSubTitle2']!,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/frog.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _texts['exTitle3']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                _texts['exSubTitle3']!,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Map<String, String> getLocalizedTexts(bool language) {
    return {
      'title':
          language ? "Welcome to Nature A to Z" : "Bem-vindo a Nature de A a Z",
      'subTitle': language
          ? "Your ultimate guide to everything from the wonders of 'A' to the mysteries of 'Z' in the environment!"
          : "Seu guia definitivo para tudo, desde as maravilhas do 'A' até os mistérios do 'Z' no ambiente!",
      'card1': language ? "+ 3K \nITEMS" : "+ 3Mil \nITEMS",
      'card2': language ? "Over 5 \nBIOMES" : "Mais de 5\n BIOMAS",
      'card3': language ? "+ 150 \nIMAGES" : "+ 150 \nIMAGENS",
      'Description': language ? 'Research offered' : 'Pesquisas oferecidas',
      'exTitle1': language ? "Random" : "Aleatório",
      'exTitle2': language ? "Dictionary" : "Dicionário",
      'exTitle3': language ? "Especific" : "Específico",
      'exSubTitle1': language
          ? "Randomly search mode, where it brings an item with an image in a random way."
          : "Pesquise no modo aleatório, onde traz um item com imagem de forma randomica.",
      'exSubTitle2': language
          ? "Search for items by a letter, the result will be all items with the requested letter."
          : "Procure items por uma letra, o resultado será todos items com a letra solicitada.",
      'exSubTitle3': language
          ? "Search for a specific item according to its name."
          : "Procure um item específico de acordo com o nome.",
    };
  }
}
