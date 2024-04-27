import 'package:flutter/material.dart';
import 'package:natureatoz/models/item.dart';

class ItemsProvider extends ChangeNotifier {
  List<Item> items = [];

  ItemsProvider({
    List<Item>? initialItems,
  }) {
    if (initialItems != null) {
      items.addAll(initialItems);
    }
  }

  void addItem({required Item item}) {
    items.add(item);
    notifyListeners();
  }

  void removeItem({required Item item}) {
    items.remove(item);
    notifyListeners();
  }
}
