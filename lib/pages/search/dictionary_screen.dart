import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natureatoz/components/button.dart';
import 'package:natureatoz/pages/search/items/multi_itens_screen.dart';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return MaterialApp(
        home: Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xFFF2F2F2),
          child: Column(children: [
            const SizedBox(height: 70),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(width: 12),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/svg/arrow-left.svg',
                    height: 26,
                    width: 32,
                  ))
            ]),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 26,
                itemBuilder: (context, index) {
                  String letter = String.fromCharCode(index + 65);
                  return Container(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: ButtonSunshine(
                            text: letter,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MultiItensScreen(letter: letter)),
                              );
                            },
                          )));
                },
              ),
            ),
          ])),
    ));
  }
}
