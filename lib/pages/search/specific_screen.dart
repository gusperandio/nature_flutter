import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:natureatoz/components/accordion.dart';
import 'package:natureatoz/components/toast.dart';
import 'package:natureatoz/controllers/specific.dart';
import 'package:natureatoz/models/item.dart';
import 'package:natureatoz/providers/items_provider.dart';
import 'package:natureatoz/providers/language_provider.dart';
import 'package:provider/provider.dart';

class SpecificScreen extends StatefulWidget {
  @override
  _SpecificScreenState createState() => _SpecificScreenState();
}

class _SpecificScreenState extends State<SpecificScreen> {
  late Future<List<Item>>? _futureItems;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureItems = null;
  }

  @override
  Widget build(BuildContext context) {
    final language = context.watch<LanguageProvider>().language == "En-US";
    final _texts = getLocalizedTexts(language);
    final listProvider = context.watch<ItemsProvider>().items;
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(
                      'assets/svg/arrow-left.svg',
                      height: 26,
                      width: 32,
                    ))),
            GestureDetector(
                onTap: () {
                  setState(() {
                    _futureItems = null;
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(
                      'assets/svg/text-wrap.svg',
                      height: 26,
                      width: 32,
                    ))),
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
                          content: Text(_texts['validation']!),
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
                        FocusScope.of(context).unfocus();
                      });
                    },
                  ),
                  labelText: _texts['search']!,
                  helperText: _texts['subtitle']!,
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
                          return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: Container(
                                  height: 200,
                                  width: double.infinity,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svg/notFind.svg',
                                          height: 120,
                                          width: 120,
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          _texts['error']!,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xFF222222)),
                                        )
                                      ])));
                        } else {
                          List<Item> items = snapshot.data!;

                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32),
                                  child: AccordionSunshine(
                                    item: items[index],
                                    fav: listProvider.contains(items[index]),
                                    onFavoritePressed: () {
                                      // Ajuste aqui
                                      final isFavorite =
                                          listProvider.contains(items[index]);
                                      if (isFavorite) {
                                        listProvider.remove(items[index]);
                                        CustomToast.show(
                                            '${items[index].title} ${_texts['toastRemove']!}');
                                      } else {
                                        listProvider.add(items[index]);
                                        CustomToast.show(
                                            '${items[index].title} ${_texts['toastAdd']!}');
                                      }
                                    },
                                    language: language,
                                  ));
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
                                const SizedBox(height: 12),
                                Text(
                                  _texts['make']!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xFF222222)),
                                )
                              ]))))
        ],
      ),
    )));
  }

  Map<String, String> getLocalizedTexts(bool language) {
    return {
      'search': language ? "Search" : "Pesquisar",
      'subtitle': language ? "Search by title" : "Busque pelo titulo",
      'make': language ? "Make your search" : "Faça sua pesquisa",
      'toastRemove':
          language ? "removed from favorites" : "removido dos favoritos",
      'toastAdd': language ? "added to favorites" : "adicionado aos favoritos",
      'validation': language
          ? "Searches must be longer than 2 characters"
          : "As pesquisas devem ser feitas acima de 2 caracteres",
      'error': language
          ? "We didn't find your search"
          : "Não encontramos sua pesquisa",
    };
  }
}
