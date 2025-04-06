import 'package:flutter/material.dart';
import '../main.dart'; // Importamos el widget SolicitudForm desde main.dart

class SolicitudFormWidget extends StatelessWidget { //renombramos la clase para evitar conflictos.
  const SolicitudFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SolicitudForm(); // Usamos el widget SolicitudForm del main.dart
  }
}