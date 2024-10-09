import 'package:flutter/material.dart';
import 'package:explore_mundo/components/carousel_destinos.dart';
import 'package:explore_mundo/components/destino_card.dart';
import 'package:explore_mundo/models/destino.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinosScreen extends StatelessWidget {
  const DestinosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Destino> destinos = [
      Destino(imagem: "images/paris.png", titulo: "Paris, França"),
      Destino(imagem: "images/tokyo.png", titulo: "Tóquio, Japão"),
      Destino(imagem: "images/ny.png", titulo: "Nova Iorque, EUA"),
    ];

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Descubra Destinos Incríveis!",
                  style: GoogleFonts.lora(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: CarouselDestinos(destinos: destinos),
              ),
              Center(
                child: SizedBox(
                  width: screenWidth > 600 ? 400 : screenWidth * 0.9,
                  child: const DestinoCard(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}





