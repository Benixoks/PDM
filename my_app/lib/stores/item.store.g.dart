// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemStore on ItemStoreBase, Store {
  late final _$itemsAtom = Atom(name: 'ItemStoreBase.items', context: context);

  @override
  ObservableList<Item> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<Item> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$listItemsAsyncAction =
      AsyncAction('ItemStoreBase.listItems', context: context);

  @override
  Future<void> listItems() {
    return _$listItemsAsyncAction.run(() => super.listItems());
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
