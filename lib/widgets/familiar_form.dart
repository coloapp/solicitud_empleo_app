import 'package:flutter/material.dart';

class FamiliarForm extends StatelessWidget {
  final String parentesco; // Agregamos el parámetro parentesco

  const FamiliarForm({super.key, required this.parentesco}); // Modificamos el constructor

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Datos del $parentesco', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // Usamos parentesco
        TextFormField(decoration: InputDecoration(labelText: 'Nombre')),
        TextFormField(decoration: InputDecoration(labelText: 'Edad')),
        TextFormField(decoration: InputDecoration(labelText: 'Ocupación')),
        // Agrega más campos si es necesario
      ],
    );
  }
}