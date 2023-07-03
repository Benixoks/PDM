import 'package:flutter/material.dart';
import 'package:my_app/pages/cart.page.dart';
import 'package:provider/provider.dart';

import '../models/item.model.dart';
import '../models/cart.dart';

class DetailsPage extends StatefulWidget {
  final Item item;

  const DetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  //SizeLabel? selectedSize;

  void addToCart(Item item) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.addItemToCart(widget.item);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Item adicionado com sucesso!'),
        content: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
          child: Text('Confira seu carrinho'),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 189, 1, 1),),
        ),
      ),
    );
    print('Item adicionado ao carrinho: ${item.tag}');
  }

  @override
  Widget build(BuildContext context) {
    final uniqueTag = 'item.detail.${widget.item.id}';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Detalhes do Item')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(widget.item.url),
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.item.tag),
                const Text("   -   R\$"),
                Text(widget.item.price.toStringAsFixed(2)),
              ],
            ),
            // Row(
            //   children: <Widget>[
            //     DropdownMenu<SizeLabel>(
            //       initialSelection: 1,
            //       controller: SizeController,
            //       label: const Text('Tamanho'),
            //       dropdownMenuEntries: SizeEntries,
            //       onSelected: (SizeLabel? size) {
            //         setState(() {
            //           selectedSize = size;
            //         });
            //       },
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(widget.item.description),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 189, 1, 1),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text('Voltar'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      addToCart(widget.item);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 189, 1, 1),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text('Adicionar ao Carrinho'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
