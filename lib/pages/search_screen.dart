import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      alignment: Alignment.center,
                      child: const Text('Container 1'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      alignment: Alignment.center,
                      child: const Text('Container 2'),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                     decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    alignment: Alignment.center,
                    child: const Text('Container 3'),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
