import 'package:flutter/material.dart';
import 'package:my_app/stores/order.store.dart';
import 'package:my_app/stores/user.store.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/item.model.dart';
import '../widgets/cart/cart_item.widget.dart';
import '../pages/home.page.dart';
import '../pages/order.page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, required this.cartItems}) : super(key: key);
  final List<Item> cartItems;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Future<void> createOrder(BuildContext context) async {
    final orderStore = Provider.of<OrderStore>(context, listen: false);
    final userStore = Provider.of<UserStore>(context, listen: false);

    print("user Id:");
    print(userStore.user.id);

    orderStore.createOrder(userStore.user.id);
  }

  void removeItemFromCart(Item item) {
    final orderStore = Provider.of<OrderStore>(context, listen: false);
    orderStore.cartItems.remove(item);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final orderStore = Provider.of<OrderStore>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Meu Carrinho',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: orderStore.cartItems.length,
                itemBuilder: (context, index) {
                  Item itemIndividual = orderStore.cartItems[index];
                  return CartItem(
                      item: itemIndividual, removeFunc: removeItemFromCart);
                },
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                  onPressed: () => {createOrder(context)},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 189, 1, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Finalizar Pedido',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 189, 1, 1),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Continuar comprando',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // @override
    // Widget build(BuildContext context) {
    //   return Consumer<Cart>(
    //     builder: (context, cart, child) {
    //       return Scaffold(
    //         appBar: AppBar(
    //           automaticallyImplyLeading: false,
    //           title: const Text(
    //             'Meu Carrinho',
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    //           ),
    //         ),
    //         body: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const SizedBox(height: 20),
    //               Expanded(
    //                 child: ListView.builder(
    //                   itemCount: cart.getUserCart().length,
    //                   itemBuilder: (context, index) {
    //                     Item itemIndividual = cart.getUserCart()[index];
    //                     return CartItem(item: itemIndividual);
    //                   },
    //                 ),
    //               ),
    //               const SizedBox(height: 16),
    //               Center(
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(30.0),
    //                   child: ElevatedButton(
    //                     onPressed: () {

    //                       Navigator.pushReplacement(
    //                         context,
    //                         MaterialPageRoute(builder: (context) => OrderPage(cartItems)),
    //                       );
    //                     },

    //                     style: ElevatedButton.styleFrom(
    //                       backgroundColor: const Color.fromARGB(255, 189, 1, 1),
    //                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(4),
    //                       ),
    //                     ),
    //                     child: const Text(
    //                       'Finalizar Pedido',
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Center(
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(bottom: 45.0),
    //                   child: ElevatedButton(
    //                     onPressed: () {
    //                       Navigator.pushReplacement(
    //                         context,
    //                         MaterialPageRoute(builder: (context) => HomePage()),
    //                       );
    //                     },

    //                     style: ElevatedButton.styleFrom(
    //                       backgroundColor: Color.fromARGB(255, 189, 1, 1),
    //                       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(4),
    //                       ),
    //                     ),
    //                     child: const Text(
    //                       'Continuar comprando',
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   );
  }
}
