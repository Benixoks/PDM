import 'package:mobx/mobx.dart';
import 'package:my_app/models/item.model.dart';

part 'item.store.g.dart';

class ItemStore = ItemStoreBase with _$ItemStore;

abstract class ItemStoreBase with Store {
  @observable
  int id = -1;

  @observable
  double price = 0;

  @observable
  String description = '';

  @observable
  String tag = '';

  @observable
  String url = '';

  @action
  Future<List<Item>> listItems(int itemsPerPage, int pages) async {
    try {} catch (e) {}
    return List.empty();
  }

  // @action
  // Future<Item> getItem(int itemId) async {
  //   try {} catch (e) {}
  //   return Item(
  //       id: id, price: price, description: description, tag: tag, url: url);
  // }

  // @action
  // Future<void> addItem(
  //     String description, String price, String tag, String url) async {
  //   try {} catch (e) {}
  // }

  // @action
  // Future<void> removeItem(int itemId) async {
  //   try {} catch (e) {}
  // }

  // @action
  // Future<void> updateItem(int itemId) async {
  //   try {} catch (e) {}
  // }
}
