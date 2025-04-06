import 'package:flutter/material.dart';

class EscolaridadForm extends StatelessWidget {
  final String nivel;

  const EscolaridadForm({super.key, required this.nivel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(nivel, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextFormField(decoration: const InputDecoration(labelText: 'Institución')), // Elimina const aquí
        TextFormField(decoration: const InputDecoration(labelText: 'Periodo')), // Elimina const aquí
        TextFormField(decoration: const InputDecoration(labelText: 'Documento')), // Elimina const aquí
        // Agrega más campos si es necesario
      ],
    );
  }
}