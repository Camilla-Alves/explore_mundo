import 'package:flutter/material.dart';
import 'package:explore_mundo/screens/contato_screen.dart';
import 'package:explore_mundo/screens/pacotes_viagem_screen.dart';
import 'package:explore_mundo/screens/sobre_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          MainAxisAlignment alignment = screenWidth > 600
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.spaceAround;

          return Row(
            mainAxisAlignment: alignment,
            children: [
              IconButton(
                icon: const Icon(Icons.card_travel),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PacotesViagemScreen()),
                  );
                },
                tooltip: 'Pacotes',
              ),
              IconButton(
                icon: const Icon(Icons.contact_phone),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContatoScreen()),
                  );
                },
                tooltip: 'Contato',
              ),
              IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SobreScreen()),
                  );
                },
                tooltip: 'Sobre Nós',
              ),
            ],
          );
        },
      ),
    );
  }
}

