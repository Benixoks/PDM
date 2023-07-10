import 'package:flutter/material.dart';
import 'package:my_app/pages/details.page.dart';
import 'package:my_app/stores/user.store.dart';
import 'package:provider/provider.dart';

import 'order.page.dart';

class MinhaContaPage extends StatelessWidget {
  const MinhaContaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha conta'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'images/logo-flamengo-antigo'), // Substitua pela URL da imagem do usuário
            ),
            const SizedBox(height: 16),
            Text(
              "${userStore.user.firstName} ${userStore.user.lastName}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${userStore.user.email}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/orders",
                );
              },
              child: Text('Meus Pedidos'),
            ),
          ],
        ),
      ),
    );
  }
}
