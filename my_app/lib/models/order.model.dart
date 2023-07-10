import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:my_app/models/item.model.dart';

class Order {
  int orderId;
  List<Item> items;
  DateTime purchaseTime;
  double total;

  Order({
    required this.orderId,
    required this.items,
    required this.purchaseTime,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'items': items.map((x) => x.toMap()).toList(),
      'purchaseTime': purchaseTime.millisecondsSinceEpoch,
      'total': total,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderId: map['orderId'] as int,
      items: List<Item>.from(
        (map['items'] as List<int>).map<Item>(
          (x) => Item.fromMap(x as Map<String, dynamic>),
        ),
      ),
      purchaseTime:
          DateTime.fromMillisecondsSinceEpoch(map['purchaseTime'] as int),
      total: map['total'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(orderId: $orderId, items: $items, purchaseTime: $purchaseTime, total: $total)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.orderId == orderId &&
        listEquals(other.items, items) &&
        other.purchaseTime == purchaseTime &&
        other.total == total;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        items.hashCode ^
        purchaseTime.hashCode ^
        total.hashCode;
  }
}
