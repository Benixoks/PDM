import 'package:flutter/material.dart';
import 'package:my_app/stores/order.store.dart';
import 'package:my_app/widgets/orders/orders.wisget.dart';
import 'package:provider/provider.dart';

// import '../models/orderChangeNotifier.dart';
import '../models/order.model.dart';
import '../stores/user.store.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Future<void> fetchOrders() async {
    final orderProvider = Provider.of<OrderStore>(context, listen: false);
    final userProvider = Provider.of<UserStore>(context, listen: false);
    await orderProvider.listOrders(userProvider.user.id);
  }

  @override
  void initState() {
    fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderStore>(context, listen: false);
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
                itemCount: orderProvider.orders.length,
                itemBuilder: (context, index) {
                  Order orderIndividual = orderProvider.orders[index];
                  return OrderItem(order: orderIndividual);
                },
              ))
            ],
          ),
        ));
  }
}
