import 'package:flutter/material.dart';

class EmpleoForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Agrega aquí los campos relacionados con el empleo
        TextFormField(decoration: InputDecoration(labelText: 'Empleo actual')),
        TextFormField(decoration: InputDecoration(labelText: 'Salario')),
        TextFormField(decoration: InputDecoration(labelText: 'Puesto')),
        // Agrega más campos si es necesario
      ],
    );
  }
}