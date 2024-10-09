import 'package:flutter/material.dart';
import 'package:explore_mundo/models/destino.dart';
import 'package:explore_mundo/screens/destino_detalhes_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselDestinos extends StatelessWidget {
  final List<Destino> destinos;

  const CarouselDestinos({super.key, required this.destinos});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: destinos.length,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DestinoDetalhesScreen(destino: destinos[index]),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(destinos[index].imagem),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                destinos[index].titulo,
                style: GoogleFonts.playfairDisplay(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black54,
                ),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}

