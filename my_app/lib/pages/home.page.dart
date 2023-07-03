import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/pages/login.page.dart';
import 'package:my_app/widgets/home/item_card.widget.dart';
import 'package:provider/provider.dart';

import '../common/hero.dart';
import '../stores/item.store.dart';
import '../stores/user.store.dart';
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
    final userStore = Provider.of<UserStore>(context, listen: false);
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
            // return GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       HeroDialogRoute(
            //         builder: (BuildContext context) {
            //           return Center(
            //             child: Hero(
            //               tag:
            //                   'item.detail.${item.id}', //implementar lógica de id único por produto
            //               child: ItemCard(item: item),
            //             ),
            //           );
            //         },
            //       ),
            //     );
            //   },
            //   child: ItemCard(item: item),
            // );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // Widget _buildScreen(int index) {
//   List<Item> itens = [];

//   Future<void> fetchItens() async {
//     await Future.delayed(const Duration(seconds: 1));
//     itens = List.generate(
//       20,
//       (index) => Item(
//         id: 1,
//         price: 189.9,
//         description: "Camiseta Flamengo Oficial",
//         tag: "Camiseta Flamengo Oficial Preta e Vermelha",
//         url: 'lib/assets/images/camisa1.jpg',
//       ),
//     );
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userStore = Provider.of<UserStore>(context, listen: false);
//     final itemStore = Provider.of<ItemStore>(context, listen: false);

//     return Scaffold(
//       bottomNavigationBar: const BottomBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: GridView.builder(
//           itemCount: min(10, itens.length),
//           itemBuilder: (context, index) {
//             final item = itens[index];
//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   HeroDialogRoute(
//                     builder: (BuildContext context) {
//                       return Center(
//                         child: Hero(
//                           tag:
//                               'item.detail.${item.id}', //implementar lógica de id único por produto
//                           child: ItemCard(item: item),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//               child: ItemCard(item: item),
//             );
//           },
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//           ),
//         ),
//       ),
//     );
//   }
// }

class Sair extends StatelessWidget {
  const Sair();

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
