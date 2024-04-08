import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natureatoz/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

    final language = context.watch<LanguageProvider>().language;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 400,
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
                            language == 'En-US'
                                ? 'Welcome to Nature A to Z'
                                : 'Bem-vindo a Nature de A a Z',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            language == 'En-US'
                                ? "Your ultimate guide to everything from the wonders of 'A' to the mysteries of 'Z' in the environment!"
                                : "Seu guia definitivo para tudo, desde as maravilhas do 'A' até os mistérios do 'Z' no ambiente!",
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
        ],
      ),
    );
  }
}
