import 'package:flutter/material.dart';
import '../widgets/escolaridad_form.dart';

class EscolaridadPage extends StatelessWidget {
  const EscolaridadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding( // Agrega const aquí
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Escolaridad", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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