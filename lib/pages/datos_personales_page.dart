import 'package:flutter/material.dart';
import 'package:proyecto_solicitud_empleo/widgets/fecha_nacimiento_field.dart';
// ... otros imports

class DatosPersonalesPage extends StatefulWidget {
  const DatosPersonalesPage({super.key});

  @override
  _DatosPersonalesPageState createState() => _DatosPersonalesPageState();
}

class _DatosPersonalesPageState extends State<DatosPersonalesPage> {
  // ... controladores y variables

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ... campos de datos personales
            FechaNacimientoField(
              controller: _fechaNacimientoController,
              selectedDate: _selectedDate,
              onDateChanged: (DateTime date) {
                setState(() {
                  _selectedDate = date;
                  _fechaNacimientoController.text = DateFormat('dd/MM/yyyy').format(date);
                });
              },
            ),
            // ... otros campos
          ],
        ),
      ),
    );
  }
}