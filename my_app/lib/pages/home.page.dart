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
        description: "Camisa Flamengo palha",
        tag: "Camiseta",
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
        padding: const EdgeInsets.all(25.0),
        child: GridView.builder(
          itemCount: itens.length,
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

                        ),],),),);            // Implementar a lógica para lidar com a mudança no estado do switch
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
      // child: const Text('Sair');
  }
}
