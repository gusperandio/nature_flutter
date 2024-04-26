import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:natureatoz/components/accordion.dart';
import 'package:natureatoz/controllers/specific.dart';
import 'package:natureatoz/models/item.dart';

class SpecificScreen extends StatefulWidget {
  @override
  _SpecificScreenState createState() => _SpecificScreenState();
}

class _SpecificScreenState extends State<SpecificScreen> {
  late Future<List<Item>>? _futureItems;
  List<Item> list = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureItems = null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 65),
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
          Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {});
                },
                onSubmitted: (value) {
                  if (value.length >= 3) {
                    setState(() {
                      _futureItems = specificItem(value);
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Aviso'),
                          content: const Text(
                              'As pesquisas devem ser feitas acima de 2 caracteres'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _futureItems = null;
                        FocusScope.of(context).unfocus();
                      });
                    },
                  ),
                  labelText: 'Pesquisar',
                  helperText: 'Busca pelo título',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              )),
          Expanded(
              child: _futureItems != null
                  ? FutureBuilder<List<Item>>(
                      future: _futureItems,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox(
                              width: double.infinity,
                              height: double.infinity,
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
                          List<Item> items = snapshot.data!;

                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32),
                                  child: AccordionSunshine(item: items[index]));
                            },
                          );
                        }
                      },
                    )
                  : GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/undraw_empty.svg',
                                  height: 120,
                                  width: 120,
                                ),
                                Text('Faça sua pesquisa')
                              ]))))
        ],
      ),
    )));
  }
}
