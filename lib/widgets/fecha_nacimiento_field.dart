import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa intl

class FechaNacimientoField extends StatelessWidget {
  final TextEditingController controller;
  final DateTime? selectedDate;
  final Function(DateTime) onDateChanged;

  const FechaNacimientoField({
    super.key,
    required this.controller,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Fecha de Nacimiento'),
      readOnly: true,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null && picked != selectedDate) {
          onDateChanged(picked);
          controller.text = DateFormat('dd/MM/yyyy').format(picked); // Formatea la fecha
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, selecciona una fecha';
        }
        return null;
      },
    );
  }
}