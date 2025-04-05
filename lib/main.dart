import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SolicitudForm(),
    );
  }
}

class SolicitudForm extends StatefulWidget {
  const SolicitudForm({super.key});

  @override
  SolicitudFormState createState() => SolicitudFormState();
}

class SolicitudFormState extends State<SolicitudForm> {
  int _currentSection = 0;
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoPaternoController = TextEditingController();
  final _apellidoMaternoController = TextEditingController();
  final _domicilioController = TextEditingController();
  final _ciudadController = TextEditingController();
  final _entidadFederativaController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _fechaNacimientoController = TextEditingController();
  final _lugarNacimientoController = TextEditingController();
  final _curpController = TextEditingController();
  final _rfcController = TextEditingController();
  final _nssController = TextEditingController();
  final _edadController = TextEditingController();
  final _sexoController = TextEditingController();
  final _estadoCivilController = TextEditingController();

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitud de Empleo', style: GoogleFonts.poppins()),
        backgroundColor: Colors.blue[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Encabezado
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset('assets/cloud_mascot.svg', height: 100),
                    Text(
                      '¿Necesitas una solicitud de empleo lista para imprimir?',
                      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '¡Hazla aquí en minutos!',
                      style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentSection = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text('Empezar solicitud', style: GoogleFonts.poppins(fontSize: 18)),
                    ),
                  ],
                ),
              ),

              // Vista previa de la solicitud (Condicional: solo en la pantalla inicial)
              if (_currentSection == 0)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text('Vista previa de la solicitud', style: GoogleFonts.poppins()),
                  ),
                ),

              // Navegación por secciones (Condicional: solo después de "Empezar")
              if (_currentSection > 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildSectionButton(1, Icons.person, 'Datos personales'),
                    _buildSectionButton(2, Icons.school, 'Escolaridad'),
                    _buildSectionButton(3, Icons.work, 'Experiencia laboral'),
                    _buildSectionButton(4, Icons.phone, 'Referencias'),
                  ],
                ),

              // Formulario (Aquí irán los campos, los mostraremos condicionalmente)
              if (_currentSection == 1)
                _buildDatosPersonalesForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionButton(int section, IconData icon, String label) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon, color: _currentSection == section ? Colors.blue : Colors.grey),
          onPressed: () {
            setState(() {
              _currentSection = section;
            });
          },
        ),
        Text(label, style: GoogleFonts.poppins(color: _currentSection == section ? Colors.blue : Colors.grey)),
      ],
    );
  }

  Widget _buildDatosPersonalesForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("Datos Personales", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextFormField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre(s)'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu nombre';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _apellidoPaternoController,
              decoration: const InputDecoration(labelText: 'Primer Apellido'),
            ),
            TextFormField(
              controller: _apellidoMaternoController,
              decoration: const InputDecoration(labelText: 'Segundo Apellido'),
            ),
            TextFormField(
              controller: _domicilioController,
              decoration: const InputDecoration(labelText: 'Domicilio (Calle y Número)'),
            ),
            TextFormField(
              controller: _ciudadController,
              decoration: const InputDecoration(labelText: 'Ciudad o Alcaldía'),
            ),
            TextFormField(
              controller: _entidadFederativaController,
              decoration: const InputDecoration(labelText: 'Entidad Federativa del Domicilio'),
            ),
            TextFormField(
              controller: _telefonoController,
              decoration: const InputDecoration(labelText: 'Teléfono o Celular'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) { // Validación de 10 dígitos
                    return 'Ingresa un número de 10 dígitos';
                  }
                }
                return null;
              },
            ),
            _buildFechaNacimientoField(),
            TextFormField(
              controller: _lugarNacimientoController,
              decoration: const InputDecoration(labelText: 'Entidad Federativa (lugar) de Nacimiento'),
            ),
            TextFormField(
              controller: _curpController,
              decoration: const InputDecoration(labelText: 'Clave Única de Registro de Población (CURP)'),
            ),
            TextFormField(
              controller: _rfcController,
              decoration: const InputDecoration(labelText: 'Registro Federal de Contribuyentes (RFC)'),
            ),
            TextFormField(
              controller: _nssController,
              decoration: const InputDecoration(labelText: 'Número de Seguridad Social'),
            ),
            TextFormField(
              controller: _edadController,
              decoration: const InputDecoration(labelText: 'Edad (años)'),
            ),
            TextFormField(
              controller: _sexoController,
              decoration: const InputDecoration(labelText: 'Sexo (Masculino o Femenino)'),
            ),
            TextFormField(
              controller: _estadoCivilController,
              decoration: const InputDecoration(labelText: 'Estado Civil'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFechaNacimientoField() {
    return TextFormField(
      controller: _fechaNacimientoController,
      decoration: InputDecoration(
        labelText: 'Fecha de Nacimiento (dd/MM/yyyy)',
        hintText: 'dd/MM/yyyy',
        errorText: _selectedDate == null ? null : DateFormat('dd/MM/yyyy').format(_selectedDate!),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () {
            _selectDate(context);
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa tu fecha de nacimiento';
        }
        try {
          DateFormat('dd/MM/yyyy').parseStrict(value);
          return null;
        } catch (e) {
          return 'Formato de fecha inválido (dd/MM/yyyy)';
        }
      },
      keyboardType: TextInputType.datetime,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
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
  }
}