import 'package:flutter/material.dart';
import 'package:explore_mundo/utils/alert_dialog.dart';
import 'package:explore_mundo/utils/filtragem.dart';
import 'package:google_fonts/google_fonts.dart';

class PacotesViagemScreen extends StatefulWidget {
  const PacotesViagemScreen({super.key});

  @override
  PacotesViagemScreenState createState() => PacotesViagemScreenState();
}

class PacotesViagemScreenState extends State<PacotesViagemScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> pacotes = ["Paris", "Tóquio", "Nova Iorque"];
  List<String> filteredPacotes = [];

  @override
  void initState() {
    super.initState();
    filteredPacotes = pacotes;
  }

  void _filterPacotes(String query) {
    setState(() {
      filteredPacotes = filtrarPacotes(pacotes, query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pacotes de Viagens",
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
          double maxWidth = screenWidth > 600 ? 500 : screenWidth * 0.9;

          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: maxWidth,
                      child: TextField(
                        controller: _searchController,
                        onChanged: _filterPacotes,
                        decoration: const InputDecoration(
                          labelText: "Pesquisar Pacotes",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: maxWidth,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredPacotes.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              showUnderDevelopmentDialog(context);
                            },
                            child: Card(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                title: Text(
                                  filteredPacotes[index],
                                  style: GoogleFonts.lora(fontSize: 18),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.flight_takeoff),
                                  onPressed: () {
                                    showUnderDevelopmentDialog(context);
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Mais Destinos em Breve!",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Estamos trabalhando para trazer mais opções para você.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}









