import 'package:flutter/material.dart';

class Avaliacao extends StatelessWidget {
  final double avaliacaoMedia;
  final int numeroAvaliacoes;

  const Avaliacao({
    super.key,
    required this.avaliacaoMedia,
    required this.numeroAvaliacoes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Icon(
              index < avaliacaoMedia.floor()
                  ? Icons.star
                  : (index < avaliacaoMedia ? Icons.star_half : Icons.star_border),
              color: Colors.amber,
            );
          }),
        ),
        const SizedBox(height: 8),
        Text(
          '$numeroAvaliacoes avaliações',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
