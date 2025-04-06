import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DocumentacionPage extends StatefulWidget {
  const DocumentacionPage({super.key});

  @override
  DocumentacionPageState createState() => DocumentacionPageState(); // Clase pública
}

class DocumentacionPageState extends State<DocumentacionPage> { // Clase pública
  final ImagePicker _picker = ImagePicker();
  XFile? _identificacionImage;
  XFile? _domicilioImage;

  Future<void> _pickImage(ImageSource source, bool isIdentificacion) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isIdentificacion) {
          _identificacionImage = pickedFile;
        } else {
          _domicilioImage = pickedFile;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Documentación", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera, true),
            child: const Text('Tomar foto de identificación'),
          ),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery, true),
            child: const Text('Seleccionar foto de identificación'),
          ),
          if (_identificacionImage != null)
            Image.file(File(_identificacionImage!.path)), // Muestra la imagen de identificación
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera, false),
            child: const Text('Tomar foto de comprobante de domicilio'),
          ),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery, false),
            child: const Text('Seleccionar foto de comprobante de domicilio'),
          ),
          if (_domicilioImage != null)
            Image.file(File(_domicilioImage!.path)), // Muestra la imagen de domicilio
          // ... otros campos
        ],
      ),
    );
  }
}