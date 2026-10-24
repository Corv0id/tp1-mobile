import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Exercice FL3 — TextField + ElevatedButton
// Correspondance : TextInput → TextField, state.input → TextEditingController,
// Button → ElevatedButton, Alert.alert() → showDialog() + AlertDialog.
// ---------------------------------------------------------------------------

class Fl3Screen extends StatefulWidget {
  const Fl3Screen({super.key});

  @override
  State<Fl3Screen> createState() => _Fl3ScreenState();
}

class _Fl3ScreenState extends State<Fl3Screen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showText() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Texte saisi'),
        content: Text(
          _controller.text.isEmpty ? 'Aucune valeur' : _controller.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField'), leading: BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Saisir un texte',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: _showText,
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
