import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// ---------------------------------------------------------------------------
// Approfondissement C — GPS
// Afficher latitude, longitude, précision et un horodatage.
// Ajouter un bouton « Actualiser ».
// ---------------------------------------------------------------------------

class CGpsScreen extends StatefulWidget {
  const CGpsScreen({super.key});

  @override
  State<CGpsScreen> createState() => _CGpsScreenState();
}

class _CGpsScreenState extends State<CGpsScreen> {
  Position? _position;
  String _message = 'Position non demandée';
  DateTime? _date;

  String _precisionText() {
    final acc = _position?.accuracy;
    if (acc == null) return '--';
    return acc.toStringAsFixed(1);
  }

   Future<void> _refresh() async {
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
          _date = DateTime.now();
            });
}

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text('C — GPS enrichi'), leading: BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _refresh, child: const Text('Actualiser')),
            const SizedBox(height: 16),
            Text(_message),
            const SizedBox(height: 4),
            Text('Latitude : ${_position?.latitude ?? '--'}'),
            Text('Longitude : ${_position?.longitude ?? '--'}'),
             Text('Précision : ${_precisionText()} m'),
            Text('Horodatage : ${_date?.toLocal().toString() ?? '--'}'),
            ],
          ),
       ),
      );
    }
}
