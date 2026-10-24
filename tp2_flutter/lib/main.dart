import 'package:flutter/material.dart';

import 'exercises/fl1.dart';
import 'exercises/fl2.dart';
import 'exercises/fl3.dart';
import 'exercises/fl4.dart';
import 'exercises/fl5.dart';
import 'exercises/b_compteur_enrichi.dart';
import 'exercises/c_gps.dart';

// ---------------------------------------------------------------------------
// TP1 — Flutter : écran d'accueil (MaterialApp) avec un bouton par exercice.
// La navigation entre l'accueil et les exercices utilise Navigator.push.
// ---------------------------------------------------------------------------

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TP1 Flutter',
      home: HomeScreen(),
       );
      }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

   void _push(BuildContext context, Widget child) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => child),
       );
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TP1 — Flutter')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _button(context, 'FL1 — Hello World (StatelessWidget)', const Fl1Screen()),
          _button(context, 'FL2 — Compteur (StatefulWidget)', const Fl2Screen()),
          _button(context, 'FL3 — TextField + ElevatedButton', const Fl3Screen()),
          _button(context, 'FL4 — CounterCubit (Bloc/Cubit)', const Fl4Screen()),
          _button(context, 'FL5 — Géolocalisation (geolocator)', const Fl5Screen()),
          const Divider(height: 24),
          const Text('Approfondissements (section 20)'),
          const SizedBox(height: 8),
          _button(
             context,
             'B — Compteur enrichi',
             const BCompteurEnrichiScreen(),
              ),
          _button(context, 'C — GPS enrichi', const CGpsScreen()),
         ],
        ),
      );
     }

  Widget _button(BuildContext context, String label, Widget screen) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(label),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => _push(context, screen),
        ),
       );
    }
}
