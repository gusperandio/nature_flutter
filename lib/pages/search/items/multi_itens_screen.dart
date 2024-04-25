import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natureatoz/components/button.dart';

class MultiItensScreen extends StatefulWidget {
  @override
  _MultiItensScreenState createState() => _MultiItensScreenState();
}

class _MultiItensScreenState extends State<MultiItensScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return MaterialApp(
        home: Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xFFF2F2F2),
          child: const Column(children: [Text('MULTI ITEMS')])),
    ));
  }
}
