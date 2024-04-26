import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natureatoz/models/item.dart';

class LikeScreen extends StatefulWidget {
  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  
  final List<Item> items = [
    Item(
        title: 'Cura',
        description: 'Uma magia que restaura pontos de vida.',
        image:
            'https://cdn.dribbble.com/userupload/11756320/file/original-248768c1c2e907d76d5e0befed11ead9.png?resize=200x200'),
    Item(
        title: 'Invocação',
        description: 'Uma magia que traz criaturas ou objetos do plano astral.',
        image:
            'https://cdn.dribbble.com/userupload/11756296/file/original-824f363ff6abce30b4aa31a2a1ed45b0.png?resize=200x200'),
    Item(
        title: 'Teletransporte',
        description:
            'Uma magia que permite mover-se instantaneamente para outro lugar.',
        image:
            'https://cdn.dribbble.com/userupload/11756294/file/original-e45d6c67b65d33fa2003a07f40336b42.png?resize=200x200'),
    Item(
        title: 'Ilusão',
        description:
            'Uma magia que cria imagens falsas para enganar os sentidos.',
        image:
            'https://cdn.dribbble.com/userupload/11756278/file/original-f854306e8477856f63f71e330e7a8389.png?resize=200x200'),
    Item(
        title: 'Maldição',
        description: 'Uma magia que lança uma aura negativa sobre um alvo.',
        image:
            'https://cdn.dribbble.com/userupload/11756268/file/original-d50db840a76c85fb49fe5a9178ccfe7a.png?resize=200x200'),
    Item(
        title: 'Bola de Fogo',
        description: 'Uma magia ardente que inflige dano em uma área.',
        image:
            'https://cdn.dribbble.com/userupload/11756255/file/original-ca970686f5bc32e6d742fc721024391e.png?resize=200x200'),
    Item(
        title: 'Congelamento',
        description: 'Uma magia que prende os inimigos em gelo sólido.',
        image:
            'https://cdn.dribbble.com/userupload/11756266/file/original-d24385a2b7afd4eb9b2ecf5721d6b575.png?resize=200x200'),
    Item(
        title: 'Transformação',
        description: 'Uma magia que altera a forma de um objeto ou criatura.',
        image:
             'https://cdn.dribbble.com/userupload/11756274/file/original-befeab021275dfb116ec67a253b64edc.png?resize=200x200'),     
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
        home: Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFFF2F2F2),
        child: Column(
          children: [
            const SizedBox(height: 30),
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
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: item.image != null
                                    ? Image.network(
                                        item.image!,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/sebrae.png',
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
                                              items.removeAt(
                                                  index); 
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
