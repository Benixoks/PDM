import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/widgets/home/item_card.widget.dart';

class DetailsPage extends StatelessWidget {
  final Item item;

  const DetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uniqueTag = 'item.detail.${item.id}';

    return Scaffold(
      body: Center(
        child: Hero(
          tag: uniqueTag,
          child: ItemCard(item: item),
        ),
      ),
    );
  }
}
