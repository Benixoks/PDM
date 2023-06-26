import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/decorations.dart';
import '../common/validations.dart';

class AuthFormField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController nameController;
  final InputDecoration inputDecoration;
  final TextInputType keyboardType;
  final String fieldName;
  final Icon? icon;

  const AuthFormField({
    super.key,
    required this.nameController,
    required this.fieldName,
    required this.inputDecoration,
    this.icon,
    this.inputFormatters,
    this.keyboardType = TextInputType.name,
  });

  @override
  Widget build(BuildContext context) {
    final finalDecoration = MergeInputDecoration(
        input1: baseInputDecoration(context, fieldName),
        input2: inputDecoration);

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        keyboardType: keyboardType,
        controller: nameController,
        autofocus: true,
        inputFormatters: inputFormatters,
        decoration: finalDecoration.merge(),
        validator: validations[fieldName],
      ),
    );
  }
}
