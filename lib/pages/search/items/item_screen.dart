import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natureatoz/components/payment.dart';
import 'package:natureatoz/models/item.dart';
import 'package:natureatoz/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemScreen extends StatefulWidget {
  final Item itemActual;

  ItemScreen({required this.itemActual});

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  // late Future<List<Item>> futureItem;
  @override
  void initState() {
    super.initState();
    // futureItem = dictionaryItem(widget.letter);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    final language = context.watch<LanguageProvider>().language == "En-US";
    return MaterialApp(
        home: Scaffold(
            body: Container(
      color: const Color(0xFFF2F2F2),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors
                          .blue, // ou qualquer cor de fundo do seu container
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, -10), // controla a direção da sombra
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                  child: widget.itemActual.image != null && widget.itemActual.image != ""
                      ? Image.network(
                          widget.itemActual.image!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/empty.jpeg',
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
                          if (widget.itemActual.image == null || widget.itemActual.image == "")
                            Text(
                              language
                                  ? "This item doesn't contain an image"
                                  : "Este item não contém imagem",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          Text(
                            widget.itemActual.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              Positioned(
                bottom: 270,
                left: 0,
                right: MediaQuery.of(context).size.width / 1.2,
                top: 30,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                        width: 200,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white.withOpacity(0.9)),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              'assets/svg/arrow-left.svg',
                              height: 30,
                              width: 22,
                              color: Colors.black,
                            )))),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _launchURL('https://natureatoz.com.br/');
                  },
                  child: Image.asset(
                    'assets/support.png',
                    width: 120, // Definindo a largura da imagem
                    height: 40, // Definindo a altura da imagem
                  ),
                ),
                Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://pt.wikipedia.org/wiki/${widget.itemActual.title}');
                        },
                        child: SvgPicture.asset(
                          'assets/svg/wiki.svg',
                          height: 28,
                          width: 28,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(
                              'https://www.google.com/search?q=${widget.itemActual.title}');
                        },
                        child: SvgPicture.asset(
                          'assets/svg/google.svg',
                          height: 30,
                          width: 28,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 350,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Descrição",
                        style: TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.itemActual.description,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    )));
  }

  _launchURL(String _url) async {
    final Uri url = Uri.parse(_url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
