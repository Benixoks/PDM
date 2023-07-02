// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemStore on ItemStoreBase, Store {
  late final _$idAtom = Atom(name: 'ItemStoreBase.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$priceAtom = Atom(name: 'ItemStoreBase.price', context: context);

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'ItemStoreBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$tagAtom = Atom(name: 'ItemStoreBase.tag', context: context);

  @override
  String get tag {
    _$tagAtom.reportRead();
    return super.tag;
  }

  @override
  set tag(String value) {
    _$tagAtom.reportWrite(value, super.tag, () {
      super.tag = value;
    });
  }

  late final _$urlAtom = Atom(name: 'ItemStoreBase.url', context: context);

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  late final _$listItemsAsyncAction =
      AsyncAction('ItemStoreBase.listItems', context: context);

  @override
  Future<List<Item>> listItems(int itemsPerPage, int pages) {
    return _$listItemsAsyncAction
        .run(() => super.listItems(itemsPerPage, pages));
  }

  late final _$getItemAsyncAction =
      AsyncAction('ItemStoreBase.getItem', context: context);

  @override
  Future<Item> getItem(int itemId) {
    return _$getItemAsyncAction.run(() => super.getItem(itemId));
  }

  late final _$addItemAsyncAction =
      AsyncAction('ItemStoreBase.addItem', context: context);

  @override
  Future<void> addItem(
      String description, String price, String tag, String url) {
    return _$addItemAsyncAction
        .run(() => super.addItem(description, price, tag, url));
  }

  late final _$removeItemAsyncAction =
      AsyncAction('ItemStoreBase.removeItem', context: context);

  @override
  Future<void> removeItem(int itemId) {
    return _$removeItemAsyncAction.run(() => super.removeItem(itemId));
  }

  late final _$updateItemAsyncAction =
      AsyncAction('ItemStoreBase.updateItem', context: context);

  @override
  Future<void> updateItem(int itemId) {
    return _$updateItemAsyncAction.run(() => super.updateItem(itemId));
  }

  @override
  String toString() {
    return '''
id: ${id},
price: ${price},
description: ${description},
tag: ${tag},
url: ${url}
    ''';
  }
}
