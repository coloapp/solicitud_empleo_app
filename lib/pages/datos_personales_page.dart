import 'package:flutter/material.dart';
import 'package:logging/logging.dart'; // Importa logging
import 'package:intl/intl.dart'; // Importa intl para formatear la fecha

class DatosPersonalesPage extends StatefulWidget {
  const DatosPersonalesPage({super.key});

  @override
  DatosPersonalesPageState createState() => DatosPersonalesPageState();
}

class DatosPersonalesPageState extends State<DatosPersonalesPage> {
  final _formKey = GlobalKey<FormState>();
  final _fechaNacimientoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _direccionController = TextEditingController();
  final _telefonoController = TextEditingController();
  DateTime? _selectedDate; // Agregamos _selectedDate

  final Logger _log = Logger('DatosPersonalesPage'); // Crea una instancia de Logger

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField( // Campo de Nombre
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu nombre';
                }
                return null;
              },
            ),
            TextFormField( // Campo de Apellido
              controller: _apellidoController,
              decoration: const InputDecoration(labelText: 'Apellido'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa tu apellido';
                }
                return null;
              },
            ),
            TextFormField( // Campo de Dirección
              controller: _direccionController,
              decoration: const InputDecoration(labelText: 'Dirección'),
            ),
            TextFormField( // Campo de Teléfono
              controller: _telefonoController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),
            TextFormField( // Campo de Fecha de Nacimiento
              controller: _fechaNacimientoController,
              decoration: const InputDecoration(labelText: 'Fecha de Nacimiento'),
              readOnly: true,
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null && picked != _selectedDate) {
                  setState(() {
                    _selectedDate = picked;
                    _fechaNacimientoController.text = DateFormat('dd/MM/yyyy').format(picked);
                  });
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String nombre = _nombreController.text;
                  String apellido = _apellidoController.text;
                  String direccion = _direccionController.text;
                  String telefono = _telefonoController.text;
                  String fechaNacimiento = _fechaNacimientoController.text;

                  _log.info('Nombre: $nombre');
                  _log.info('Apellido: $apellido');
                  _log.info('Dirección: $direccion');
                  _log.info('Teléfono: $telefono');
                  _log.info('Fecha de Nacimiento: $fechaNacimiento');
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}