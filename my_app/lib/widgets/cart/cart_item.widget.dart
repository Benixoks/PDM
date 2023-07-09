import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';
import '../../models/item.model.dart';

class CartItem extends StatefulWidget {
  Item item;
  CartItem({super.key, required this.item});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.network(widget.item.image),
        title: Text(widget.item.tag),
        subtitle: Text('R\$' + widget.item.price.toStringAsFixed(2)),
        trailing: IconButton(
            icon: const Icon(Icons.delete), onPressed: removeItemFromCart),
      ),
    );
  }
}
