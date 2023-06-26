import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/widgets/home/item_card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> values = [
  //   'R\$219,90',
  //   'R\$269,90',
  //   'R\$399,90',
  //   'R\$269,90',
  //   'R\$189,90',
  //   'R\$269,90',
  // ];
  // List<String> valuesImg = [
  //   'lib/assets/images/camisa1.jpg',
  //   'lib/assets/images/camisa2.jpg',
  //   'lib/assets/images/camisa3.jpg',
  //   'lib/assets/images/camisa4.jpg',
  //   'lib/assets/images/camisa5.webp',
  //   'lib/assets/images/camisa6.webp'
  // ];

  List<Item> itens = [];
  var isLoading = false;

  Future<void> fetchItens() async {
    await Future.delayed(const Duration(seconds: 1));
    itens = List.generate(
      20,
      (index) => Item(
          id: 1,
          price: 189.9,
          description: "Camisa Framengo palha",
          tag: "Camiseta",
          url: 'lib/assets/images/camisa1.jpg'),
    );
    setState(() {});
  }

  final _homeController = ScrollController();
  final _searchController = TextEditingController();
  String search = '';
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.greenAccent);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Configurações',
      style: optionStyle,
    ),
    Text(
      'Sair',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    fetchItens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return ListView(
              children: [
                ...itens.map((e) => ItemCard(item: e)).toList()
                // Card(
                //   elevation: 10,
                //   child: Center(
                //       child: Padding(
                //     padding: const EdgeInsets.all(25.0),
                //     child: Column(
                //       children: [
                //         Center(
                //             child: Image(
                //           image: AssetImage(valuesImg[index]),
                //           width: 150,
                //           height: 97,
                //         )),
                //         Center(
                //           child: Text(values[index]),
                //         ),
                //       ],
                //     ),
                //   )),
                // ),
                // Card(

                //   elevation: 10,
                //   child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         RichText(
                //           text: TextSpan(
                //             text: 'Seja um membro Sócio Torcedor',
                //             style: TextStyle(color: Colors.red),
                //           ),
                //         ),
                //         Text(
                //           ' e ganhe 25% de desconto nas compras em toda a loja!',
                //         ),
                //       ],
                //     ))
              ],
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Configurações'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Sair'),
        ],
        selectedItemColor: Colors.greenAccent,
        onTap: (int index) {},
      ),
    );
  }
}

// class _listViewBody extends StatelessWidget {
//   const _listViewBody({
//     super.key,
//     required List<Widget> widgetOptions,
//     required int selectedIndex,
//   })  : _widgetOptions = widgetOptions,
//         _selectedIndex = selectedIndex;

//   final List<Widget> _widgetOptions;
//   final int _selectedIndex;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: _widgetOptions.elementAt(_selectedIndex),
//     );
//   }
// }