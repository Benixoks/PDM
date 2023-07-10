import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';

import '../../common/hero.dart';
import '../../pages/details.page.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      width: 280,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            HeroDialogRoute(
              builder: (BuildContext context) {
                return Center(
                  child: Hero(
                    tag:
                        'item.detail.${item.id}', //implementar lógica de id único por produto
                    child: DetailsPage(item: item),
                  ),
                );
              },
            ),
          );
        },
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                  child: Image.network(
                item.image,
                width: double.infinity,
                height: 230,
              )),
              Text(item.tag, textScaleFactor: 1, textAlign: TextAlign.center),
            ],
          ),
        )),
      ),
    );
  }
}
