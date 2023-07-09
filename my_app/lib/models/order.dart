import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';
import 'package:my_app/models/cart.dart';


class Order extends ChangeNotifier{

List<Item> itensShop = [
  Item(id: 1, price: 189.00, description: 'Camiseta DryFit', tag: 'Camiseta Flamengo Oficial', image: 'lib/assets/images/camisa1.jpg'),
  Item(id: 2, price: 249.00, description: 'Camiseta Preta, Vermelha e Dourada Oficial', tag: 'Camiseta Flamengo Oficial', image: 'lib/assets/images/camisa2.jpg'),
  Item(id: 3, price: 219.99, description: 'Camiseta Preta e Vermelha Oficial Copacabana Style', tag: 'Camiseta Flamengo Oficial', image: 'lib/assets/images/camisa3.jpg'),
  Item(id: 4, price: 99.00, description: 'Camiseta Rosa Masculina', tag: 'Camiseta Flamengo Oficial', image: 'lib/assets/images/camisa4.jpg'),
  ];

List<Item> meusPedidos = [];

List<Item> getItemList(){
  return itensShop;
}

//get order
List<Item> getUserOrders(){
  return meusPedidos;
}

//add itens no Meus Pedidos
int index = 0;
void addUserCart(userCart){
  meusPedidos.add(Cart() as Item );
  index++;
  notifyListeners();
}

//remove itens do Meus Pedido

void removeUserCart(userCart){
  meusPedidos.remove(Cart() as Item);
  notifyListeners();
}

}