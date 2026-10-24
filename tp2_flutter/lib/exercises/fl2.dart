import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Exercice FL2 — StatefulWidget et compteur
// Lien avec React Native : setState() reconstruit le widget concerné.
//
// Travail étudiant :
//  1. Ajouter un bouton Reset.
//  2. Bloquer la valeur minimale à 0.
//  3. Changer le titre de l'AppBar lorsque le compteur dépasse 5.
// ---------------------------------------------------------------------------

class Fl2Screen extends StatefulWidget {
  const Fl2Screen({super.key});

  @override
  State<Fl2Screen> createState() => _Fl2ScreenState();
}

class _Fl2ScreenState extends State<Fl2Screen> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);

  // Travail étudiant 2 : bloquer la valeur minimale à 0
  void _decrement() => setState(() {
        if (_counter > 0) _counter--;
      });

  // Travail étudiant 1 : bouton Reset
  void _reset() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) {
    // Travail étudiant 3 : titre dynamique quand le compteur dépasse 5
    final titre = _counter > 5
        ? 'Counter Stateful (>5)'
        : 'Counter Stateful';

    return Scaffold(
      appBar: AppBar(title: Text(titre), leading: BackButton()),
      body: Center(
        child: Text(
          '$_counter',
          style: const TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'minus',
            onPressed: _decrement,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: _reset,
            child: const Icon(Icons.restart_alt),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: 'plus',
            onPressed: _increment,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
