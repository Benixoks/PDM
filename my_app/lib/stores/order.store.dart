import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:my_app/services/order.service.dart';

import '../models/item.model.dart';
import '../models/order.model.dart';

part 'order.store.g.dart';

class OrderStore = OrderStoreBase with _$OrderStore;

abstract class OrderStoreBase with Store {
  final OrderService _service = OrderService();

  @observable
  ObservableList<Order> orders = <Order>[].asObservable();

  @action
  Future<void> listOrders(int userId) async {
    try {
      var response = await _service.listOrders(userId);

      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        var listItem = jsonResponse.map((order) => Order(
              orderId: order["orderId"],
              items: createItemsList(order["items"]),
              purchaseTime: order["purchaseTime"],
              total: order["total"],
            ));
        orders.addAll(listItem);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> createOrder(int userId, List<int> purchasedItemsIds) async {
    try {
      await _service.createOrder(userId, purchasedItemsIds);
    } catch (e) {
      rethrow;
    }
  }

  List<Item> createItemsList(List<Map<String, dynamic>> itemsMap) {
    return itemsMap
        .map((item) => Item(
              id: item["id"],
              price: item["price"],
              description: item["description"],
              tag: item["tag"],
              image: item["image"],
            ))
        .toList();
  }
}
