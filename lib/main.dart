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
  final _edadController = TextEditingController();
  final _domicilioController = TextEditingController();
  final _coloniaController = TextEditingController();
  final _codigoPostalController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _sexoController = TextEditingController();
  final _ciudadController = TextEditingController();
  final _entidadFederativaController = TextEditingController();
  final _lugarNacimientoController = TextEditingController();
  final _fechaNacimientoController = TextEditingController();
  final _nacionalidadController = TextEditingController();
  final _viveConController = TextEditingController();
  final _dependientesController = TextEditingController();
  final _estadoCivilController = TextEditingController();
  final _curpController = TextEditingController();
  final _aforeController = TextEditingController();
  final _rfcController = TextEditingController();
  final _licenciaManejoController = TextEditingController();
  final _cartillaMilitarController = TextEditingController();
  final _pasaporteController = TextEditingController();
  final _nssController = TextEditingController();
  final _licenciaClaseNumeroController = TextEditingController();
  final _extranjeroController = TextEditingController();

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
            if (_currentSection == 1) ..._buildSeccionDatosPersonales(),
            if (_currentSection == 2) ..._buildSeccionEscolaridad(),
            if (_currentSection == 3) ..._buildSeccionExperienciaLaboral(),
            if (_currentSection == 4) ..._buildSeccionReferencias(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSeccionDatosPersonales() {
    return [
      const Text("Datos Personales", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      TextFormField(controller: _apellidoPaternoController, decoration: const InputDecoration(labelText: 'Primer Apellido')),
      TextFormField(controller: _apellidoMaternoController, decoration: const InputDecoration(labelText: 'Segundo Apellido')),
      TextFormField(controller: _nombreController, decoration: const InputDecoration(labelText: 'Nombre(s)')),
      TextFormField(controller: _edadController, decoration: const InputDecoration(labelText: 'Edad (años)')),
      TextFormField(controller: _domicilioController, decoration: const InputDecoration(labelText: 'Domicilio (Calle y Número)')),
      TextFormField(controller: _coloniaController, decoration: const InputDecoration(labelText: 'Colonia')),
      TextFormField(controller: _codigoPostalController, decoration: const InputDecoration(labelText: 'Código Postal')),
      TextFormField(controller: _telefonoController, decoration: const InputDecoration(labelText: 'Teléfono o Celular'), keyboardType: TextInputType.phone),
      TextFormField(controller: _sexoController, decoration: const InputDecoration(labelText: 'Sexo (Masculino o Femenino)')),
      TextFormField(controller: _ciudadController, decoration: const InputDecoration(labelText: 'Ciudad o Alcaldía')),
      TextFormField(controller: _entidadFederativaController, decoration: const InputDecoration(labelText: 'Entidad Federativa del Domicilio')),
      TextFormField(controller: _lugarNacimientoController, decoration: const InputDecoration(labelText: 'Entidad Federativa (lugar) de Nacimiento')),
      _buildFechaNacimientoField(),
      TextFormField(controller: _nacionalidadController, decoration: const InputDecoration(labelText: 'Nacionalidad')),
      TextFormField(controller: _viveConController, decoration: const InputDecoration(labelText: 'Vive con (Padres, Familia, Parientes)')),
      TextFormField(controller: _dependientesController, decoration: const InputDecoration(labelText: 'Personas que dependen de usted (Hijos, Cónyuge, Padres)')),
      TextFormField(controller: _estadoCivilController, decoration: const InputDecoration(labelText: 'Estado Civil')),
      const Text("DOCUMENTACIÓN", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      TextFormField(controller: _curpController, decoration: const InputDecoration(labelText: 'Clave Única de Registro de Población (CURP)')),
      TextFormField(controller: _aforeController, decoration: const InputDecoration(labelText: 'No de AFORE')),
      TextFormField(controller: _rfcController, decoration: const InputDecoration(labelText: 'Registro Federal de Contribuyentes (RFC)')),
      TextFormField(controller: _licenciaManejoController, decoration: const InputDecoration(labelText: '¿Tiene Licencia de Manejo? (Si o No)')),
      TextFormField(controller: _cartillaMilitarController, decoration: const InputDecoration(labelText: 'Cartilla de Servicio Militar No.')),
      TextFormField(controller: _pasaporteController, decoration: const InputDecoration(labelText: 'No. Pasaporte')),
      TextFormField(controller: _nssController, decoration: const InputDecoration(labelText: 'Número de Seguridad Social')),
      TextFormField(controller: _licenciaClaseNumeroController, decoration: const InputDecoration(labelText: 'Clase y número de licencia')),
      TextFormField(controller: _extranjeroController, decoration: const InputDecoration(labelText: 'Siendo extranjero:')),
    ];
  }

  List<Widget> _buildSeccionEscolaridad() {
    return [
      const Text("Escolaridad", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      _buildEscolaridadForm("Primaria"),
      _buildEscolaridadForm("Secundaria"),
      _buildEscolaridadForm("Preparatoria o Vocacional"),
      _buildEscolaridadForm("Profesional"),
      _buildEscolaridadForm("Comercial u otras"),
      _buildEstudiosActualesForm(),
    ];
  }

  Widget _buildEscolaridadForm(String nivel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(nivel, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextFormField(decoration: const InputDecoration(labelText: 'Nombre de la escuela')),
        TextFormField(decoration: const InputDecoration(labelText: 'Domicilio')),
        Row(
          children: [
            Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'De'))),
            const SizedBox(width: 10),
            Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'A'))),
          ],
        ),
        TextFormField(decoration: const InputDecoration(labelText: 'Años')),
        TextFormField(decoration: const InputDecoration(labelText: 'Título Recibido')),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildEstudiosActualesForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Estudios que está efectuando en la actualidad", style: TextStyle(fontWeight: FontWeight.bold)),
        TextFormField(decoration: const InputDecoration(labelText: 'Escuela')),
        TextFormField(decoration: const InputDecoration(labelText: 'Horario')),
        TextFormField(decoration: const InputDecoration(labelText: 'Curso o carrera')),
        TextFormField(decoration: const InputDecoration(labelText: 'Grado')),
      ],
    );
  }

  List<Widget> _buildSeccionExperienciaLaboral() {
    return [
      const Text("Empleo Actual o Anteriores", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      _buildEmpleoForm("Empleo actual o último"),
      _buildEmpleoForm("Empleo anterior"),
      _buildEmpleoForm("Empleo anterior"),
      Row(
        children: [
          const Text("Podemos solicitar informes de usted?"),
          Radio(value: true, groupValue: null, onChanged: (value) {}),
          const Text("Sí"),
          Radio(value: false, groupValue: null, onChanged: (value) {}),
          const Text("No (Razones)"),
        ],
      ),
    ];
  }

  Widget _buildEmpleoForm(String titulo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextFormField(decoration: const InputDecoration(labelText: 'Tiempo que prestó sus servicios')),
        TextFormField(decoration: const InputDecoration(labelText: 'Nombre de la Empresa')),
        TextFormField(decoration: const InputDecoration(labelText: 'Domicilio')),
        TextFormField(decoration: const InputDecoration(labelText: 'Teléfono')),
        TextFormField(decoration: const InputDecoration(labelText: 'Puesto')),
        Row(
          children: [
            Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Inicial'))),
            const SizedBox(width: 10),
            Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Final'))),
          ],
        ),
        Row(
          children: [
            Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Sueldos Inicial'))),
            const SizedBox(width: 10),
            Expanded(child: TextFormField(decoration: const InputDecoration(labelText: 'Sueldos Final'))),
          ],
        ),
        TextFormField(decoration: const InputDecoration(labelText: 'Motivos de su separación')),
        TextFormField(decoration: const InputDecoration(labelText: 'Nombre de su jefe inmediato')),
        TextFormField(decoration: const InputDecoration(labelText: 'Actividades Desempeñadas')),
        const SizedBox(height: 10),
      ],
    );
  }

  List<Widget> _buildSeccionReferencias() {
    return [
      const Text("Referencias Personales", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      _buildReferenciaForm(),
      _buildReferenciaForm(),
      _buildReferenciaForm(),
    ];
  }

  Widget _buildReferenciaForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(decoration: const InputDecoration(labelText: 'Nombre')),
        TextFormField(decoration: const InputDecoration(labelText: 'Domicilio')),
        TextFormField(decoration: const InputDecoration(labelText: 'Teléfono')),
        TextFormField(decoration: const InputDecoration(labelText: 'Ocupación')),
        TextFormField(decoration: const InputDecoration(labelText: 'Tiempo de conocerse')),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildFechaNacimientoField() {
    _fechaNacimientoController.addListener(() {
      final text = _fechaNacimientoController.text;
      if (text.length == 2 && !text.endsWith('/')) {
        _fechaNacimientoController.value = TextEditingValue(
          text: '$text/',
          selection: TextSelection.fromPosition(
            TextPosition(offset: '$text/'.length),
          ),
        );
      } else if (text.length == 5 && !text.endsWith('/')) {
        _fechaNacimientoController.value = TextEditingValue(
          text: '$text/',
          selection: TextSelection.fromPosition(
            TextPosition(offset: '$text/'.length),
          ),
        );
      }
    });

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