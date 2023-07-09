import 'package:flutter/material.dart';
import 'package:my_app/widgets/orders/orders.wisget.dart';
import 'package:provider/provider.dart';

import '../models/item.model.dart';
import '../models/orderChangeNotifier.dart';

class OrderPage extends StatefulWidget {
  final List<Item> cartItems;
  const OrderPage(this.cartItems, {super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Order>(builder: (context, order, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Meus Pedidos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                  width: 40,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: order.getUserOrders().length,
                  itemBuilder: (context, index) {
                    Order orderIndividual =
                        order.getUserOrders()[index] as Order;
                    return OrderItem(order: orderIndividual);
                  },
                ))
              ],
            ),
          ));
    });
  }
}
