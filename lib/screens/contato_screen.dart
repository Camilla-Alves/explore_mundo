import 'package:flutter/material.dart';
import 'package:explore_mundo/components/botao_gradiente.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class ContatoScreen extends StatelessWidget {
  const ContatoScreen({super.key});

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'contato@exploremundo.com',
      query: 'subject=Olá',
    );
    await launchUrl(emailLaunchUri);
  }

  void _callPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '+559999999999',
    );
    await launchUrl(phoneLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contato',
          style: GoogleFonts.lora(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          // double maxWidth = screenWidth > 600 ? 400 : screenWidth * 0.9;

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Se você tiver alguma dúvida ou precisar de assistência, não hesite em nos contatar!',
                    style: GoogleFonts.lora(
                      fontSize: 18,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone, size: 30, color: Colors.blue),
                      const SizedBox(width: 10),
                      Text(
                        'Telefone:',
                        style: GoogleFonts.lora(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '+55 99 9999-9999',
                    style: GoogleFonts.lora(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.email, size: 30, color: Colors.blue),
                      const SizedBox(width: 10),
                      Text(
                        'E-mail:',
                        style: GoogleFonts.lora(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'contato@exploremundo.com',
                    style: GoogleFonts.lora(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: screenWidth > 600 ? 300 : 250,
                    child: GradientButton(
                      text: 'Enviar E-mail',
                      onPressed: _sendEmail,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth > 600 ? 300 : 250,
                    child: GradientButton(
                      text: 'Ligar para o Suporte',
                      onPressed: _callPhone,
                    ),
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
