import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/widgets/details/dropdown.widget.dart';

class DetailsPage extends StatefulWidget {
  final Item item;

  const DetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  SizeLabel? selectedSize;

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
            Image(
              fit: BoxFit.cover,
              image: AssetImage(widget.item.url),
              width: double.infinity,
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
              child: Column(children: [Text(widget.item.description)],),
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

  void addToCart(Item item) {
    // Lógica para adicionar o item ao carrinho
    print('Item adicionado ao carrinho: ${item.description}');
  }
}
