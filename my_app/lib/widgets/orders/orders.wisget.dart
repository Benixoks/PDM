import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/models/order.dart';
import 'package:provider/provider.dart';
import 'package:my_app/models/cart.dart';


class OrderItem extends StatefulWidget {
  Order order;
  OrderItem({super.key, required this.order});
  

  @override
  State<OrderItem> createState() => OrderItemState();
}

class OrderItemState extends State<OrderItem> {
    void removeOrderFromOrders(){
    Provider.of<Order>(context, listen: false).removeUserCart(widget.order);
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset('logo-flamengo.png'),
        title: Text('Pedido 1'),
        subtitle: Text('Total: R\$587,90'),
        trailing: IconButton(icon: const Icon(Icons.delete), onPressed: removeOrderFromOrders),
      ),
    );
  }
}