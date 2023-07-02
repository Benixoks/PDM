import 'package:flutter/material.dart';
import 'package:my_app/widgets/common/bottom_bar.widget.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Configurações')),
      ),
      bottomNavigationBar: const BottomBar(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preferências',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            SwitchListTile(
                title: const Text('Notificações'),
                value: true,
                onChanged: (value) {}),
          ],
        ),
      ),
    );
  }
}
