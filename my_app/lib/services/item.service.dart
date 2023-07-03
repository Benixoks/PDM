import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ItemService {
  String baseUrl = 'https://localhost:52741/item/list';
  Map<String, String> baseHeaders = {
    'Content-Type': 'application/json',
    'accept': 'text/plain'
  };

  Future<Response> listItems() async {
    Response? response;
    var body = json.encode({"itemsPerPage": 9, "pages": 0});
    var url = Uri.parse(baseUrl);

    try {
      response = await http.post(url, headers: baseHeaders, body: body);
    } catch (e) {
      rethrow;
    }

    return response;
  }
}
