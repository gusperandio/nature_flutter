import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:natureatoz/models/item.dart';

Future<List<Item>> dictionaryItem(String x) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=utf-8'
  };

  http.Response resp = await http.get(
      Uri.parse(
          'https://natureatoz.com.br/api/v1/dictionary/${x.toUpperCase()}'),
      headers: headers);

  if (resp.statusCode == 200) {
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));
    List<Item> list = [];
    for (var item in decodedData) {
      if (item['image'] == null) {
        item['image'] = '';
      }

      list.add(Item.fromJson(item));
    }
    return list;
  } else {
    throw Exception('Failed to load item');
  }
}
