import 'package:flutter/material.dart';

class ConocimientosGeneralesPage extends StatelessWidget {
  const ConocimientosGeneralesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Conocimientos Generales", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // ... campos de conocimientos generales
        ],
      ),
    );
  }
}