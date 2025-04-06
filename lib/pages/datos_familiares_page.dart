import 'package:flutter/material.dart';
import '../widgets/familiar_form.dart';

class DatosFamiliaresPage extends StatelessWidget {
  const DatosFamiliaresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding( // Agrega const aquí
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Datos Familiares", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          FamiliarForm(parentesco: "Padre"),
          FamiliarForm(parentesco: "Madre"),
          FamiliarForm(parentesco: "Esposa(o)"),
          // ... otros campos
        ],
      ),
    );
  }
}