import 'package:flutter/material.dart';
import 'package:natureatoz/models/item.dart';

class ItemsProvider extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  void addItem({required Item item}) async {
    _items.add(item);
    notifyListeners();
  }

  void removeItem({required Item item}) async {
    _items.remove(item);
    notifyListeners();
  }
}
