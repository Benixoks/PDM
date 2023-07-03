import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/widgets/home/item_card.widget.dart';
import 'package:provider/provider.dart';
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
    await Future.delayed(const Duration(seconds: 1));
    //ItemStore.listItens

    itens = List.generate(
      20,
      (index) => Item(
        id: 1,
        price: 189.9,
        description: "Camiseta Flamengo Oficial",
        tag: "Camiseta Flamengo Oficial Preta e Vermelha",
        url: 'lib/assets/images/camisa1.jpg',
      ),
    );
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

    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: min(10, itens.length),
          itemBuilder: (context, index) {
            final item = itens[index];
            return ItemCard(item: item);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}
