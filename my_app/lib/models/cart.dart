import 'package:flutter/material.dart';
import 'package:my_app/models/item.model.dart';

class Cart extends ChangeNotifier {
//lista de itens para compra

List<Item> itensShop = [
  Item(id: 1, price: 189.00, description: 'Camiseta DryFit', tag: 'Camiseta Flamengo Oficial', url: 'lib/assets/images/camisa1.jpg'),
  Item(id: 2, price: 249.00, description: 'Camiseta Preta, Vermelha e Dourada Oficial', tag: 'Camiseta Flamengo Oficial', url: 'lib/assets/images/camisa2.jpg'),
  Item(id: 3, price: 219.99, description: 'Camiseta Preta e Vermelha Oficial Copacabana Style', tag: 'Camiseta Flamengo Oficial', url: 'lib/assets/images/camisa3.jpg'),
  Item(id: 4, price: 99.00, description: 'Camiseta Rosa Masculina', tag: 'Camiseta Flamengo Oficial', url: 'lib/assets/images/camisa4.jpg'),
];

//lista de itens do usuário no carrinho
  List<Item> userCart = [];

//get lista de itens para venda
  List<Item> getItemList() {
    return itensShop;
  }

//get cart
  List<Item> getUserCart() {
    return userCart;
  }

//add itens no cart

  void addItemToCart(Item itens) {
    userCart.add(itens);
    notifyListeners();
  }

//remove itens do cart

  void removeItemFromCart(Item itens) {
    userCart.remove(itens);
    notifyListeners();
  }
}
