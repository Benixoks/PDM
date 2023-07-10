import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/models/order.model.dart';
import 'package:provider/provider.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/stores/order.store.dart';
import '../../models/order.model.dart';

class OrderItem extends StatefulWidget {
  Order order;
  OrderItem({super.key, required this.order});
  

  @override
  State<OrderItem> createState() => OrderItemState();
}

    

  
  
class OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset('logo-flamengo.png'),
        title: Text('Pedido 1'),
        subtitle: Text('Total: R\$'),
        trailing: IconButton(icon: const Icon(Icons.delete), onPressed: (){}),
      ),
    );
  }
}