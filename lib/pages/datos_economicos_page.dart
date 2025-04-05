import 'package:flutter/material.dart';

class DatosEconomicosPage extends StatelessWidget {
  const DatosEconomicosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Datos Económicos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // ... campos de datos económicos
        ],
      ),
    );
  }
}