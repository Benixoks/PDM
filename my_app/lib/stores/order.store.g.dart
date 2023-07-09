// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderStore on OrderStoreBase, Store {
  late final _$ordersAtom =
      Atom(name: 'OrderStoreBase.orders', context: context);

  @override
  ObservableList<Order> get orders {
    _$ordersAtom.reportRead();
    return super.orders;
  }

  @override
  set orders(ObservableList<Order> value) {
    _$ordersAtom.reportWrite(value, super.orders, () {
      super.orders = value;
    });
  }

  late final _$listOrdersAsyncAction =
      AsyncAction('OrderStoreBase.listOrders', context: context);

  @override
  Future<void> listOrders(int userId) {
    return _$listOrdersAsyncAction.run(() => super.listOrders(userId));
  }

  late final _$createOrderAsyncAction =
      AsyncAction('OrderStoreBase.createOrder', context: context);

  @override
  Future<void> createOrder(int userId, List<int> purchasedItemsIds) {
    return _$createOrderAsyncAction
        .run(() => super.createOrder(userId, purchasedItemsIds));
  }

  @override
  String toString() {
    return '''
orders: ${orders}
    ''';
  }
}
