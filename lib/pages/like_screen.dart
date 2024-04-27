import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natureatoz/models/item.dart';
import 'package:natureatoz/providers/items_provider.dart';
import 'package:provider/provider.dart';

class LikeScreen extends StatefulWidget {
  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
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
                child: ListView.builder(
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
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            if (item.image != null)
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.transparent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    item.image ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      title:
                                          Text('Deseja remover ${item.title}'),
                                      content: const Text(
                                          'Após confirmar o item será removido da sua lista de itens favoritos'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              items.removeAt(index);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Confirmar'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cancelar'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: SvgPicture.asset(
                                'assets/svg/heart.svg',
                                height: 32,
                                width: 32,
                              ),
                            )
                          ],
                        )));
              },
            )),
          ],
        ),
      ),
    ));
  }
}
