import 'package:flutter/material.dart';

class ReferenciaForm extends StatelessWidget {
  const ReferenciaForm({super.key}); // Agregamos el parámetro key

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(decoration: const InputDecoration(labelText: 'Nombre de la referencia')), // Agregamos const
        TextFormField(decoration: const InputDecoration(labelText: 'Teléfono de la referencia')), // Agregamos const
        TextFormField(decoration: const InputDecoration(labelText: 'Relación con la referencia')), // Agregamos const
        // Agrega más campos si es necesario
      ],
    );
  }
}