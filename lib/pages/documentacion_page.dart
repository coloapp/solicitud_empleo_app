import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ... otros imports

class DocumentacionPage extends StatefulWidget {
  const DocumentacionPage({super.key});

  @override
  _DocumentacionPageState createState() => _DocumentacionPageState();
}

class _DocumentacionPageState extends State<DocumentacionPage> {
  // ... controladores y variables
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
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera, false),
            child: const Text('Tomar foto de comprobante de domicilio'),
          ),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery, false),
            child: const Text('Seleccionar foto de comprobante de domicilio'),
          ),
          // ... otros campos
        ],
      ),
    );
  }
}