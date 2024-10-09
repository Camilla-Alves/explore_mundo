import 'package:flutter/material.dart';

class PacoteItem extends StatelessWidget {
  final String titulo;
  final VoidCallback onPressed;

  const PacoteItem({
    super.key,
    required this.titulo,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(titulo),
        trailing: IconButton(
          icon: const Icon(Icons.flight_takeoff),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
