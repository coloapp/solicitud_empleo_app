import 'package:flutter/material.dart';

class EstadoSaludHabitosPage extends StatelessWidget {
  const EstadoSaludHabitosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Estado de Salud y Hábitos Personales", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // ... campos de estado de salud y hábitos personales
        ],
      ),
    );
  }
}