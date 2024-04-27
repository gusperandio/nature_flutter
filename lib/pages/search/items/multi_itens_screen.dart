import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natureatoz/components/accordion.dart';
import 'package:natureatoz/components/button.dart';
import 'package:natureatoz/components/toast.dart';
import 'package:natureatoz/models/item.dart';
import 'package:natureatoz/controllers/dictionary.dart';
import 'package:natureatoz/providers/items_provider.dart';
import 'package:natureatoz/providers/language_provider.dart';
import 'package:provider/provider.dart';

class MultiItensScreen extends StatefulWidget {
  final String letter;

  MultiItensScreen({required this.letter});

  @override
  _MultiItensScreenState createState() => _MultiItensScreenState();
}

class _MultiItensScreenState extends State<MultiItensScreen> {
  late Future<List<Item>> futureItem;

  @override
  void initState() {
    super.initState();
    futureItem = dictionaryItem(widget.letter);
  }

  Future<void> refreshItem() async {
    setState(() {
      futureItem = dictionaryItem(widget.letter);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
     final language = context.watch<LanguageProvider>().language == "En-US";
    final _texts = getLocalizedTexts(language);
    final listProvider = context.watch<ItemsProvider>().items;
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
                      child: FutureBuilder<List<Item>>(
                    future: futureItem,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: AccordionSunshine(
                                  item: items[index],
                                  fav: listProvider.contains(items[index]),
                                  onFavoritePressed: () {
                                    final isFavorite =
                                        listProvider.contains(items[index]);
                                    if (isFavorite) {
                                      listProvider.remove(
                                          items[index]); 
                                          CustomToast.show('${items[index].title} ${_texts['toastRemove']}');
                                    } else {
                                      listProvider.add(
                                          items[index]); 
                                          CustomToast.show('${items[index].title} ${_texts['toastAdd']}');
                                    }
                                  },
                                ));
                          },
                        );
                      }
                    },
                  ))
                ]))));
  }

  Map<String, String> getLocalizedTexts(bool language) {
    return {
      'toastRemove':
          language ? "removed from favorites" : "removido dos favoritos",
      'toastAdd': language ? "added to favorites" : "adicionado aos favoritos",
    };
  }
}
