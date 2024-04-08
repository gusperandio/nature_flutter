import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String language;

  LanguageProvider({
    this.language = "En-US",
  });

  void changeLanguage({
    required String newLanguage,
  }) async {
     language = newLanguage;
     notifyListeners();
  }
}
