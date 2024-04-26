import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:natureatoz/models/item.dart';

Future<Item> randomItem() async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=utf-8'
  };

  http.Response resp = await http.get(
      Uri.parse('https://natureatoz.com.br/api/v1/random/image'),
      headers: headers);

  if (resp.statusCode == 200) {
    final decodedData = json.decode(utf8.decode(resp.bodyBytes));
    return Item.fromJson(decodedData);
  } else {
    throw Exception('Failed to load item');
  }
}
