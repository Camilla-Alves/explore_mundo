import 'package:flutter/material.dart';
import 'package:explore_mundo/models/comentario.dart';
import 'package:intl/intl.dart';

class Comentarios extends StatefulWidget {
  final List<Comentario> comentarios;
  final TextEditingController comentarioController;
  final Function(String) onComentarioSubmitted;
  final String usuario;

  const Comentarios({
    super.key,
    required this.comentarios,
    required this.comentarioController,
    required this.onComentarioSubmitted,
    required this.usuario,
  });

  @override
  State<Comentarios> createState() => _ComentariosState();
}

class _ComentariosState extends State<Comentarios> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Comentários:",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.comentarioController,
          decoration: const InputDecoration(
            labelText: "Compartilhe sua experiência!",
            border: OutlineInputBorder(),
          ),
          onSubmitted: (text) {
            if (text.isNotEmpty) {
              widget.onComentarioSubmitted(text);
              widget.comentarioController.clear();
            }
          },
        ),
        const SizedBox(height: 8),
        ...widget.comentarios.map((comentario) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${comentario.usuario} - ${DateFormat('dd/MM/yyyy - HH:mm').format(comentario.dataHora)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(comentario.texto),
                ],
              ),
            ),
          ),
        )),
      ],
    );
  }
}


