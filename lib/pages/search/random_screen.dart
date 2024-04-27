import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natureatoz/controllers/random.dart';
import 'package:natureatoz/models/item.dart';
import 'dart:convert' show utf8;

class ModalRandom extends StatefulWidget {
  const ModalRandom({super.key});

  @override
  _ModalRandomState createState() => _ModalRandomState();
}

class _ModalRandomState extends State<ModalRandom> {
  late Future<Item> futureItem;
  @override
  void initState() {
    super.initState();
    futureItem = randomItem();
  }

  Future<void> refreshItem() async {
    setState(() {
      futureItem = randomItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FutureBuilder<Item>(
          future: futureItem,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                  width: double.infinity,
                  height: 420,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      )
                    ],
                  ));
            } else if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              snapshot.hasData && snapshot.data!.image != null
                                  ? NetworkImage(snapshot.data!.image!)
                                      as ImageProvider<Object>
                                  : const AssetImage('assets/wpp1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black.withOpacity(0.3))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.blue),
                          child: GestureDetector(
                            onTap: () {
                              refreshItem();
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Estou com sorte',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    SvgPicture.asset(
                                      'assets/svg/refresh.svg',
                                      height: 16,
                                      width: 16,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black.withOpacity(0.2)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: SvgPicture.asset(
                              'assets/svg/minimize.svg',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data?.title ?? "Item",
                                style: const TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                snapshot.data!.description,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
