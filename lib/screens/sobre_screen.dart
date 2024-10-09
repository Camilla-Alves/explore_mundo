import 'package:flutter/material.dart';
import 'package:explore_mundo/components/botao_gradiente.dart';
import 'package:explore_mundo/components/info_card.dart';
import 'package:explore_mundo/screens/pacotes_viagem_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sobre Nós",
          style: GoogleFonts.lora(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double maxWidth = screenWidth > 600 ? 600 : screenWidth * 0.9;
          double fontSizeTitle = screenWidth > 600 ? 28 : 20;
          double fontSizeText = screenWidth > 600 ? 16 : 14;
          double fontSizeHighlightText = screenWidth > 600 ? 20 : 18;
          double iconSize = screenWidth > 600 ? 30 : 20;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Text(
                      "A \"Explore Mundo\"",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: fontSizeTitle,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Text(
                      "Estamos em busca de melhorias para tornar nosso aplicativo mais atrativo e funcional. "
                          "O objetivo é proporcionar uma experiência em que os usuários possam explorar destinos, "
                          "consultar pacotes de viagens, efetuar reservas e obter informações detalhadas sobre as "
                          "localizações e as avaliações de estrelas para cada destino.",
                      style: GoogleFonts.lora(
                        fontSize: fontSizeText,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 12,
                    children: [
                      InfoCard(icon: Icons.location_on, title: "Explore Destinos", iconSize: iconSize),
                      InfoCard(icon: Icons.flight, title: "Encontre Pacotes", iconSize: iconSize),
                      InfoCard(icon: Icons.contact_support, title: "Tire Dúvidas", iconSize: iconSize),
                      InfoCard(icon: Icons.chat, title: "Comente e Avalie", iconSize: iconSize),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Text(
                      "Faça já a sua reserva!",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: fontSizeHighlightText,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GradientButton(
                    text: "Ver Pacotes Disponíveis",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PacotesViagemScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}









