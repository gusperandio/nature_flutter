import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 100,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: const Text('Container 1'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 100,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: const Text('Container 2'),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text('Container 3'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
