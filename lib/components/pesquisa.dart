import 'package:flutter/material.dart';

class Pesquisa extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const Pesquisa({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: const InputDecoration(
        labelText: "Pesquisar",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}
