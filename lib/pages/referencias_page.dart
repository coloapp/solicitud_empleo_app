import 'package:flutter/material.dart';
import '../widgets/referencia_form.dart'; // Importa el widget personalizado

class ReferenciasPage extends StatelessWidget {
  const ReferenciasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Referencias Personales", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ReferenciaForm(),
          ReferenciaForm(),
          ReferenciaForm(),
          // ... otros campos
        ],
      ),
    );
  }
}