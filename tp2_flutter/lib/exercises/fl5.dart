import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// ---------------------------------------------------------------------------
// Exercice FL5 — Accéder à la position GPS avec geolocator
// Asynchrisme : Future / async / await. Flow de permission : service →
// checkPermission → requestPermission → getCurrentPosition.
// Retour : BackButton dans l'AppBar.
// ---------------------------------------------------------------------------

class Fl5Screen extends StatefulWidget {
  const Fl5Screen({super.key});

  @override
  State<Fl5Screen> createState() => _Fl5ScreenState();
}

class _Fl5ScreenState extends State<Fl5Screen> {
  Position? _position;
  String _message = 'Position non demandée';

   Future<void> _getPosition() async {
    bool enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) {
      setState(() => _message = 'Service de localisation désactivé');
      return;
       }

     LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      }

     if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
      setState(() => _message = 'Permission refusée');
      return;
       }

      final position = await Geolocator.getCurrentPosition();
      setState(() {
          _position = position;
          _message = 'Position obtenue';
           });
}

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar:
        AppBar(title: const Text('Géolocalisation Flutter'), leading: BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getPosition,
              child: const Text('Obtenir ma position'),
             ),
            const SizedBox(height: 16),
            Text(_message),
            Text('Latitude : ${_position?.latitude ?? '--'}'),
            Text('Longitude : ${_position?.longitude ?? '--'}'),
           ],
         ),
       ),
     );
   }
}
