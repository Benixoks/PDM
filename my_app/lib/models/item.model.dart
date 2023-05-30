// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  final int id;
  final double price;
  final String description;
  final String tag;
  final String url;

  Item({
    required this.id,
    required this.price,
    required this.description,
    required this.tag,
    required this.url,
  });

  Item copyWith({
    int? id,
    double? price,
    String? description,
    String? tag,
    String? url,
  }) {
    return Item(
      id: id ?? this.id,
      price: price ?? this.price,
      description: description ?? this.description,
      tag: tag ?? this.tag,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'description': description,
      'tag': tag,
      'url': url,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      price: map['price'] as double,
      description: map['description'] as String,
      tag: map['tag'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, price: $price, description: $description, tag: $tag, url: $url)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.price == price &&
        other.description == description &&
        other.tag == tag &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        price.hashCode ^
        description.hashCode ^
        tag.hashCode ^
        url.hashCode;
  }
}
