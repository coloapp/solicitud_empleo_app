import 'package:flutter/material.dart';

class EmpleoForm extends StatelessWidget {
  final String titulo; // Agregamos el parámetro titulo

  const EmpleoForm({super.key, required this.titulo}); // Modificamos el constructor

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // Usamos el parámetro titulo
        TextFormField(decoration: const InputDecoration(labelText: 'Salario')),
        TextFormField(decoration: const InputDecoration(labelText: 'Puesto')),
        TextFormField(decoration: const InputDecoration(labelText: 'Periodo')),
        // Agrega más campos si es necesario
      ],
    );
  }
}