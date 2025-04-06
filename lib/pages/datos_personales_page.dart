import 'package:flutter/material.dart';
import '../widgets/fecha_nacimiento_field.dart';
import 'package:intl/intl.dart';

class DatosPersonalesPage extends StatefulWidget {
  const DatosPersonalesPage({super.key});

  @override
  DatosPersonalesPageState createState() => DatosPersonalesPageState(); // Clase pública
}

class DatosPersonalesPageState extends State<DatosPersonalesPage> { // Clase pública
  final _formKey = GlobalKey<FormState>();
  final _fechaNacimientoController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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