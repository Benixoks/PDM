import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';

class ItemCard extends StatelessWidget {
  // Item item = Item(
  //     id: 1,
  //     price: 89,
  //     description: "placeholder",
  //     tag: "tag",
  //     url: "placeholder");
  Item item;

  ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
                child: Image(
              image: AssetImage(item.url),
              width: 150,
              height: 97,
            )),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Text(item.description),
            ),
          ],
        ),
      )),
    );
  }
}
