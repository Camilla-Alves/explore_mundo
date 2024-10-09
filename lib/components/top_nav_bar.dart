import 'package:flutter/material.dart';
import 'package:explore_mundo/screens/contato_screen.dart';
import 'package:explore_mundo/screens/destinos_screen.dart';
import 'package:explore_mundo/screens/pacotes_viagem_screen.dart';
import 'package:explore_mundo/screens/sobre_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Mundo'),
        backgroundColor: const Color(0xFFD1C4E9),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double screenWidth = constraints.maxWidth;
              double spacing = screenWidth > 600 ? 30 : 10;

              return TabBar(
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(icon: Icon(Icons.travel_explore)),
                  Tab(icon: Icon(Icons.card_travel)),
                  Tab(icon: Icon(Icons.contact_phone)),
                  Tab(icon: Icon(Icons.info)),
                ],
                labelPadding: EdgeInsets.symmetric(horizontal: spacing),
              );
            },
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          DestinosScreen(),
          PacotesViagemScreen(),
          ContatoScreen(),
          SobreScreen(),
        ],
      ),
    );
  }
}
