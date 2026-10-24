import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Exercice FL1 — Hello World avec StatelessWidget
// À comprendre : l'interface est une arborescence de widgets ; StatelessWidget
// n'a pas d'état mutable local ; build() décrit la UI ; MaterialApp + Scaffold
// fournissent la structure Material.
// Retour : on utilise Navigator.pop via un BackButton dans l'AppBar.
// ---------------------------------------------------------------------------

class Fl1Screen extends StatelessWidget {
  const Fl1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Welcome to Flutter'),
      ),
      body: const Center(
        child: Text(
          'Hello World',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
