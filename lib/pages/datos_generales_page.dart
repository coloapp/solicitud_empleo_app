import 'package:flutter/material.dart';

class DatosGeneralesPage extends StatelessWidget {
  const DatosGeneralesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding( // Agregamos const aquí
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Datos Generales", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // ... campos de datos generales
        ],
      ),
    );
  }
}