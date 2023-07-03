import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  final TextEditingController sizeController = TextEditingController();
  SizeLabel? selectedSize;
  String selectedOption = 'Média';
  List<String> options = ['Pequena', 'Média', 'Grande'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue!;
            });
          },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SizeLabel {
}
