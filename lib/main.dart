import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_solicitud_empleo/pages/home_page.dart';
import 'package:proyecto_solicitud_empleo/pages/datos_personales_page.dart';
import 'package:proyecto_solicitud_empleo/pages/escolaridad_page.dart';
import 'package:proyecto_solicitud_empleo/pages/experiencia_laboral_page.dart';
import 'package:proyecto_solicitud_empleo/pages/referencias_page.dart';
import 'package:proyecto_solicitud_empleo/pages/estado_salud_habitos_page.dart';
import 'package:proyecto_solicitud_empleo/pages/datos_familiares_page.dart';
import 'package:proyecto_solicitud_empleo/pages/conocimientos_generales_page.dart';
import 'package:proyecto_solicitud_empleo/pages/datos_generales_page.dart';
import 'package:proyecto_solicitud_empleo/pages/datos_economicos_page.dart';
import 'package:proyecto_solicitud_empleo/pages/documentacion_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class SolicitudForm extends StatefulWidget {
  const SolicitudForm({super.key});

  @override
  SolicitudFormState createState() => SolicitudFormState();
}

class SolicitudFormState extends State<SolicitudForm> {
  int _currentSection = 1; // Comenzamos con la sección de datos personales

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
              // Navegación por secciones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildSectionButton(1, Icons.person, 'Datos personales'),
                  _buildSectionButton(2, Icons.school, 'Escolaridad'),
                  _buildSectionButton(3, Icons.work, 'Experiencia laboral'),
                  _buildSectionButton(4, Icons.phone, 'Referencias'),
                  _buildSectionButton(5, Icons.health_and_safety, 'Salud y hábitos'),
                  _buildSectionButton(6, Icons.people, 'Datos familiares'),
                  _buildSectionButton(7, Icons.lightbulb, 'Conocimientos'),
                  _buildSectionButton(8, Icons.info, 'Datos generales'),
                  _buildSectionButton(9, Icons.attach_money, 'Datos económicos'),
                  _buildSectionButton(10, Icons.description, 'Documentación'),
                ],
              ),

              // Contenido de la sección actual
              _buildSectionContent(),
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

  Widget _buildSectionContent() {
    switch (_currentSection) {
      case 1:
        return DatosPersonalesPage();
      case 2:
        return EscolaridadPage();
      case 3:
        return ExperienciaLaboralPage();
      case 4:
        return ReferenciasPage();
      case 5:
        return EstadoSaludHabitosPage();
      case 6:
        return DatosFamiliaresPage();
      case 7:
        return ConocimientosGeneralesPage();
      case 8:
        return DatosGeneralesPage();
      case 9:
        return DatosEconomicosPage();
      case 10:
        return DocumentacionPage();
      default:
        return DatosPersonalesPage(); // Por defecto, mostramos la página de datos personales
    }
  }
}