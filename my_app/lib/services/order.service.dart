import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class OrderService {
  String baseUrl = 'https://localhost:7108';

  Map<String, String> baseHeaders = {
    'Content-Type': 'application/json',
    'accept': 'text/plain'
  };

  Future<Response> listOrders(int userId) async {
    Response? response;

    var url = Uri.parse("$baseUrl/$userId/list");

    try {
      response = await http.get(url, headers: baseHeaders);
    } catch (e) {
      rethrow;
    }

    return response;
  }

  Future<Response> createOrder(int userId, List<int> purchasedItemsIds) async {
    Response? response;
    var body = json.encode({
      "userId": userId,
      "purchasedItemsIds": purchasedItemsIds,
    });
    var url = Uri.parse("$baseUrl/create");

    try {
      response = await http.post(url, headers: baseHeaders, body: body);
    } catch (e) {
      rethrow;
    }

    return response;
  }
}
