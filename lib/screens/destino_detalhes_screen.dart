import 'package:flutter/material.dart';
import 'package:explore_mundo/data/comentarios_repository.dart';
import 'package:explore_mundo/components/bottom_nav_bar.dart';
import 'package:explore_mundo/models/destino.dart';
import 'package:explore_mundo/components/avaliacao.dart';
import 'package:explore_mundo/models/comentario.dart';
import 'package:explore_mundo/components/comentarios.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinoDetalhesScreen extends StatefulWidget {
  final Destino destino;

  const DestinoDetalhesScreen({super.key, required this.destino});

  @override
  DestinoDetalhesScreenState createState() => DestinoDetalhesScreenState();
}

class DestinoDetalhesScreenState extends State<DestinoDetalhesScreen> {
  final Map<String, String> informacoesDestinos = {
    'Paris, França': 'Paris é a capital da França, famosa por sua arte, moda e cultura. Visite a Torre Eiffel e o Museu do Louvre.',
    'Tóquio, Japão': 'Tóquio, a capital do Japão, é uma metrópole vibrante que mistura tradição e modernidade. Não perca os templos e a tecnologia.',
    'Nova Iorque, EUA': 'Nova Iorque é conhecida por seus arranha-céus e atrações icônicas como a Estátua da Liberdade e o Central Park.',
  };

  List<Comentario> comentarios = [];
  final TextEditingController _comentarioController = TextEditingController();
  final String _usuario = "Usuário";

  @override
  void initState() {
    super.initState();
    carregarComentarios();
  }

  Future<void> carregarComentarios() async {
    comentarios = await ComentarioRepository.carregarComentarios(widget.destino.titulo);
    setState(() {});
  }

  Future<void> salvarComentarios() async {
    await ComentarioRepository.salvarComentarios(widget.destino.titulo, comentarios);
  }

  @override
  Widget build(BuildContext context) {
    String destinoTitulo = widget.destino.titulo;
    String informacao = informacoesDestinos[destinoTitulo] ?? 'Informação não disponível.';

    double avaliacaoMedia = 4.5;
    int numeroAvaliacoes = 4;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          destinoTitulo,
          style: GoogleFonts.lora(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFD1C4E9),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double imageHeight = screenWidth > 600 ? 500 : 200;
          double imageWidth = screenWidth > 600 ? 650 : screenWidth * 0.95;

          return Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.destino.imagem,
                    height: imageHeight,
                    width: imageWidth,
                    fit: BoxFit.cover,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Saiba mais sobre o seu próximo destino!",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: imageWidth,
                      child: Text(
                        informacao,
                        style: GoogleFonts.lora(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Avaliacao(
                      avaliacaoMedia: avaliacaoMedia,
                      numeroAvaliacoes: numeroAvaliacoes,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: imageWidth,
                      child: Comentarios(
                        comentarios: comentarios,
                        comentarioController: _comentarioController,
                        usuario: _usuario,
                        onComentarioSubmitted: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              final novoComentario = Comentario(
                                usuario: _usuario,
                                texto: value,
                                dataHora: DateTime.now().toLocal(),
                              );
                              comentarios.add(novoComentario);
                              salvarComentarios();
                              _comentarioController.clear();
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}






