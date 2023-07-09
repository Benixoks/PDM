import 'package:flutter/material.dart';
import 'package:my_app/pages/cart.page.dart';
import 'package:provider/provider.dart';
import '../models/item.model.dart';
import '../models/cart.dart';
import 'conta.page.dart';

class DetailsPage extends StatefulWidget {
  final Item item;

  const DetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  void addToCart(Item item) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.addItemToCart(widget.item);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Item adicionado com sucesso!'),
        content: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage(cartItems: [],)),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,

            backgroundColor: const Color.fromARGB(255, 189, 1, 1),),
             child:  const Text('Confira seu carrinho'),

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
                image: AssetImage(widget.item.image),
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

                      
                      backgroundColor: const Color.fromARGB(255, 189, 1, 1),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text('Voltar'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      addToCart(widget.item);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,

                      
                      backgroundColor: const Color.fromARGB(255, 189, 1, 1),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text('Adicionar ao Carrinho'),
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
