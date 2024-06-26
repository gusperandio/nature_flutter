import 'package:flutter/material.dart';
import 'package:natureatoz/pages/search/dictionary_screen.dart';
import 'package:natureatoz/pages/search/random_screen.dart';
import 'package:natureatoz/pages/search/specific_screen.dart';
import 'package:natureatoz/providers/language_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

void _showModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ModalRandom();
    },
  );
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final language = context.watch<LanguageProvider>().language == "En-US";
    final _texts = getLocalizedTexts(language);

    return MaterialApp(
        home: Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFFF2F2F2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SpecificScreen()),
                            )
                          },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Stack(children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(18),
                              image: const DecorationImage(
                                image: AssetImage('assets/frog.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.black.withOpacity(0.5)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        _texts["item1"]!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        ]),
                      )),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DictionaryScreen()),
                      )
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Stack(children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                              image: AssetImage('assets/atoz.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black.withOpacity(0.5)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      _texts["item2"]!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ]),
                    ),
                  )
                ],
              ),
              GestureDetector(
                  onTap: () => _showModal(context),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 0),
                      child: Stack(children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage('assets/dices.jpg'),
                                fit: BoxFit.cover,
                              )),
                          alignment: Alignment.center,
                        ),
                        Positioned(
                          bottom: 12,
                          left: 0,
                          right: 0,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black.withOpacity(0.5)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      _texts["item3"]!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ]))),
            ],
          ),
        ),
      ),
    ));
  }

  Map<String, String> getLocalizedTexts(bool language) {
    return {
      'item1': language ? "Especific" : "Específico",
      'item2': language ? "Dictionary" : "Dicionário",
      'item3': language ? "Random" : "Aleatório",
    };
  }
}
