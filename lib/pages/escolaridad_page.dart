import 'package:flutter/material.dart';
import 'package:proyecto_solicitud_empleo/widgets/escolaridad_form.dart'; // Importa el widget personalizado

class EscolaridadPage extends StatelessWidget {
  const EscolaridadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Escolaridad", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          EscolaridadForm(nivel: "Primaria"),
          EscolaridadForm(nivel: "Secundaria"),
          EscolaridadForm(nivel: "Preparatoria o Vocacional"),
          EscolaridadForm(nivel: "Profesional"),
          EscolaridadForm(nivel: "Comercial u otras"),
          // ... otros campos
        ],
      ),
    );
  }
}