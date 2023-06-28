import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/pages/login.page.dart';
import 'package:my_app/widgets/home/item_card.widget.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> itens = [];
  var isLoading = false;
  int _selectedIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return Home(itens: itens);
      case 1:
        return Config();
      case 2:
        return Sair();
      default:
        return const Center(child: Text('Rota inválida'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      resizeToAvoidBottomInset: false,
      body: _buildScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Configurações'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Sair'),
        ],
        selectedItemColor: Colors.greenAccent,
      ),
    );
  }
}




class Home extends StatelessWidget {
  final List<Item> itens;

  const Home({required this.itens});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: min(10, itens.length),
          itemBuilder: (context, index) {
            final item = itens[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  HeroDialogRoute(
                    builder: (BuildContext context) {
                      return Center(
                        child: Hero(
                          tag: 'item.detail.${item.id}', //implementar lógica de id único por produto
                          child: ItemCard(item: item),
                        ),
                      );
                    },
                  ),
                );
              },
              child: ItemCard(item: item),
              );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  HeroDialogRoute({required this.builder});

  @override
  Color? get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => '';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;
}

class DetailsPage extends StatelessWidget {
  final Item item;

  const DetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: 'item_${item.id}',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.file(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      File('lib/assets/images/camisa1.jpg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              item.description,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}





class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Configurações')),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preferências',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            SwitchListTile(
              title: Text('Notificações'),
              value: true,
              onChanged: (value) {}

        ),
      ],
    ),
  ),
);            // Implementar a lógica para lidar com a mudança no estado do switch
}}

class Sair extends StatelessWidget {
  const Sair();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
              title: const Text('Tem certeza que deseja sair?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Fechar o diálogo
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false, // Impede o retorno à página anterior
                    );
                  },
                  child: const Text('Sair'),
                ),
              ],
            );
  }
}
