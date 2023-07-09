import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/services/item.service.dart';

part 'item.store.g.dart';

class ItemStore = ItemStoreBase with _$ItemStore;

abstract class ItemStoreBase with Store {
  final ItemService _service = ItemService();

  @observable
  ObservableList<Item> items = <Item>[].asObservable();

  @action
  Future<void> listItems() async {
    try {
      var response = await _service.listItems();
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        var listItem = jsonResponse.map((item) => Item(
            id: item["id"],
            price: item["price"],
            description: item["description"],
            tag: item["tag"],
            image: item["image"]));
        items.addAll(listItem);
      }
      print(items);
    } catch (e) {
      rethrow;
    }
  }

  void updateItems(dynamic item) {
    print("store");
    print(item);
  }
}
