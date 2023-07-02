import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/widgets/home/item_card.widget.dart';

class DetailsPage extends StatelessWidget {
  final Item item;

  const DetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uniqueTag = 'item.detail.${item.id}';

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Item'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                fit: BoxFit.cover,
                image: AssetImage(item.url),
                width: double.infinity),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text('Voltar'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    addToCart(item);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text('Adicionar ao Carrinho'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addToCart(Item item) {
    //model Cart
    //store Cart
    //service Cart

    print('Item adicionado ao carrinho: ${item.description}');
  }
}
