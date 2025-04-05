import 'package:flutter/material.dart';
import 'package:proyecto_solicitud_empleo/widgets/empleo_form.dart'; // Importa el widget personalizado

class ExperienciaLaboralPage extends StatelessWidget {
  const ExperienciaLaboralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Empleo Actual o Anteriores", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          EmpleoForm(titulo: "Empleo actual o último"),
          EmpleoForm(titulo: "Empleo anterior"),
          EmpleoForm(titulo: "Empleo anterior"),
          // ... otros campos
        ],
      ),
    );
  }
}