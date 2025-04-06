import 'package:flutter/material.dart';

class ReferenciaForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Agrega aquí los campos relacionados con las referencias
        TextFormField(decoration: InputDecoration(labelText: 'Nombre de la referencia')),
        TextFormField(decoration: InputDecoration(labelText: 'Teléfono de la referencia')),
        TextFormField(decoration: InputDecoration(labelText: 'Relación con la referencia')),
        // Agrega más campos si es necesario
      ],
    );
  }
}