import 'package:flutter/material.dart';
import 'package:natureatoz/screens/home_screen.dart';
import 'package:natureatoz/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class AppSettings extends ChangeNotifier {
  String language = 'Portuguese';

  void setLanguage(String newLanguage) {
    language = newLanguage;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
