import 'package:flutter/material.dart';


class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  List<String> favorites = [];

  void toggleFavorite(String item) {
    setState(() {
      if (favorites.contains(item)) {
        favorites.remove(item);
      } else {
        favorites.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isFavorite = favorites.contains(item);
          return ListTile(
            title: Text(item),
            trailing: IconButton(
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: isFavorite ? Colors.amber : null,
              ),
              onPressed: () {
                toggleFavorite(item);
              },
            ),
          );
        },
      ),
    );
  }
}