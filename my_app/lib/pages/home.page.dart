import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/pages/cart.page.dart';
import 'package:my_app/pages/login.page.dart';
import 'package:my_app/widgets/home/item_card.widget.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../stores/item.store.dart';
import '../widgets/common/bottom_bar.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> itens = [];

  Future<void> fetchItens() async {
    final itemStore = Provider.of<ItemStore>(context, listen: false);

    itemStore.listItems();
    setState(() {});
  }

  @override
  void initState() {
    fetchItens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemStore = Provider.of<ItemStore>(context, listen: false);
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        bottomNavigationBar: const BottomBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: min(4, itemStore.items.length),
                  itemBuilder: (context, index) {
                    Item item = value.getItemList()[index];
                    return ItemCard(item: item);
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 189, 1, 1),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage(cartItems: [],)),
            );
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
