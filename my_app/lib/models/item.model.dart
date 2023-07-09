// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  final int id;
  final double price;
  final String description;
  final String tag;
  final String image;

  Item({
    required this.id,
    required this.price,
    required this.description,
    required this.tag,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'description': description,
      'tag': tag,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      price: map['price'] as double,
      description: map['description'] as String,
      tag: map['tag'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, price: $price, description: $description, tag: $tag, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.price == price &&
        other.description == description &&
        other.tag == tag &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        price.hashCode ^
        description.hashCode ^
        tag.hashCode ^
        image.hashCode;
  }
}
