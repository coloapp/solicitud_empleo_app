import 'package:flutter/material.dart';

class EstadoSaludHabitosPage extends StatelessWidget {
  const EstadoSaludHabitosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding( // Agregamos const aquí
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Estado de Salud y Hábitos Personales", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          // ... campos de estado de salud y hábitos personales
        ],
      ),
    );
  }
}