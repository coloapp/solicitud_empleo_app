import 'package:flutter/material.dart';

class FamiliarForm extends StatelessWidget {
  final String parentesco;

  const FamiliarForm({super.key, required this.parentesco});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Datos del $parentesco', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextFormField(decoration: const InputDecoration(labelText: 'Nombre')), // Elimina const aquí
        TextFormField(decoration: const InputDecoration(labelText: 'Edad')), // Elimina const aquí
        TextFormField(decoration: const InputDecoration(labelText: 'Ocupación')), // Elimina const aquí
        // Agrega más campos si es necesario
      ],
    );
  }
}