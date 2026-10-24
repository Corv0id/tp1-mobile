import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Approfondissement B — Compteur enrichi
// Ajouter +1, -1, +5, Reset et une couleur différente selon la valeur.
// ---------------------------------------------------------------------------

class BCompteurEnrichiScreen extends StatefulWidget {
  const BCompteurEnrichiScreen({super.key});

  @override
  State<BCompteurEnrichiScreen> createState() => _BCompteurEnrichiScreenState();
}

class _BCompteurEnrichiScreenState extends State<BCompteurEnrichiScreen> {
  int counter = 0;

  void change(int n) => setState(() => counter += n);
  void reset() => setState(() => counter = 0);

   Color colorFor() {
    if (counter < 0) return Colors.red;
    if (counter == 0) return Colors.grey;
    if (counter >= 5) return Colors.teal;
    return const Color(0xFF1F4E78);
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('B — Compteur enrichi'), leading: BackButton()),
      body: Center(
        child: Text(
          '$counter',
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: colorFor()),
          ),
        ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'plus5',
            onPressed: () => change(5),
            child: const Text('+5'),
            ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'plus',
            onPressed: () => change(1),
            child: const Icon(Icons.add),
            ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'minus',
            onPressed: () => change(-1),
            child: const Icon(Icons.remove),
            ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: reset,
            child: const Icon(Icons.restart_alt),
            ),
          ],
        ),
      );
    }
}
