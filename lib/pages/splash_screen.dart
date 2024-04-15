import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natureatoz/pages/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natureatoz/providers/language_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final String assetName = 'assets/arrow-down.svg';
final Widget svgIcon = SvgPicture.asset(
  assetName,
  semanticsLabel: 'Sua Imagem SVG',
  placeholderBuilder: (BuildContext context) => Container(
    padding: const EdgeInsets.all(30.0),
    child: const CircularProgressIndicator(),
  ),
);

final Widget brazil = Image.asset(
  'assets/brazil.png',
  width: 350,
  height: 350,
);

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  String selectedItem = 'English';
  String selectedLanguage = 'En-US';
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;
  bool showItem = false;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0, // completamente transparente
      end: 1.0, // totalmente visível
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves
            .easeInOut, // inicia o fade-in antes da animação de deslocamento
      ),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // posição inicial (abaixo)
      end: const Offset(0, -120), // posição final (no topo)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // curva de animação
    ));

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          showItem = true;
        });
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _controller.dispose();
    super.dispose();
  }

  void navigateToHomeScreen(BuildContext context) {
    context
        .read<LanguageProvider>()
        .changeLanguage(newLanguage: selectedLanguage);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: Transform.translate(
                      offset: _offsetAnimation.value,
                      child: child,
                    ),
                  );
                },
                child: Image.asset(
                  'assets/logo.png',
                  width: 350,
                  height: 350,
                ),
              ),
            ),
            showItem
                ? Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 82.0, vertical: 0.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 0.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xFFFFFFFF)),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: Container(),
                            icon: const SizedBox.shrink(),
                            value: selectedItem,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedItem = newValue!;
                                selectedLanguage = selectedItem == 'English'
                                    ? 'En-US'
                                    : 'Pt-BR';
                              });
                            },
                            padding: const EdgeInsets.all(9.0),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                            items: [
                              'English',
                              'Português',
                            ].map<DropdownMenuItem<String>>((String value) {
                              String imagePath = value == 'English'
                                  ? 'assets/states.png'
                                  : 'assets/brazil.png';
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    Text(
                                      value,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    const SizedBox(width: 30),
                                    Image.asset(
                                      imagePath,
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          )),
                      const SizedBox(height: 16),
                      FilledButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: const Color(0xFFFFBD16),
                          ),
                          onPressed: () {
                            navigateToHomeScreen(context);
                          },
                          child: Text(
                              selectedLanguage == 'En-US' ? 'Start' : 'Iniciar',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ))),
                    ],
                  )
                : const SizedBox(
                    height: 130,
                  ),
            // DropdownButton
          ],
        ),
      ),
    );
  }
}
