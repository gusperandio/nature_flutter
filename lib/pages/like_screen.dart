import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natureatoz/models/item.dart';
import 'package:natureatoz/pages/search/items/item_screen.dart';
import 'package:natureatoz/providers/items_provider.dart';
import 'package:natureatoz/providers/language_provider.dart';
import 'package:provider/provider.dart';

class LikeScreen extends StatefulWidget {
  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    final language = context.watch<LanguageProvider>().language == "En-US";
    final _texts = getLocalizedTexts(language);
    final items = context.watch<ItemsProvider>().items;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
        home: Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFFF2F2F2),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Expanded(
              child: items.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/empty_likes.svg',
                          height: 124,
                          width: 124,
                        ),
                        const SizedBox(height: 12),
                        Text(language
                            ? "Search an item and favorite him"
                            : "Procure um item e favorite ele.")
                      ],
                    )
                  : ListView.builder(
                      itemCount: items.length,
                      itemExtent: 90,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Container(
                          width: 330,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            border: const Border(
                              left: BorderSide(
                                color: Colors.green,
                                width: 4,
                              ),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 6),
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        item.description,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                              _texts['select']!,
                                              textAlign: TextAlign.center,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ItemScreen(
                                                                itemActual:
                                                                    item)),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.remove_red_eye,
                                                  size: 32,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    items.removeAt(index);
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Icon(
                                                  Icons.delete,
                                                  size: 32,
                                                  color: Color.fromARGB(
                                                      255, 236, 7, 7),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(_texts['close']!),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Icon(
                                      Icons.more_vert,
                                      size: 32,
                                      color: Color.fromARGB(100, 0, 0, 0),
                                    )
                                    // SvgPicture.asset(
                                    //   'assets/svg/heart.svg',
                                    //   height: 32,
                                    //   width: 32,
                                    // ),
                                    )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    ));
  }

  Map<String, String> getLocalizedTexts(bool language) {
    return {
      'select': language ? "Select one option" : "Selecione uma opção",
      'close': language ? "Close" : "Fechar",
    };
  }
}
