import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<String> images = [
    'assets/images/Imagen1.jpg',
    'assets/images/Imagen2.jpg',
    'assets/images/Imagen3.jpg',
    'assets/images/Imagen4.jpg'
  ];

  Future<void> _saveBackgroundImage(String imageUrl, VoidCallback onComplete) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('backgroundImage', imageUrl);
    onComplete(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecciona una imagen de fondo:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Separar la lógica de guardado y navegación
                      _saveBackgroundImage(images[index], () {
                        if (mounted) {
                          Navigator.pop(context);
                        }
                      });
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Image.asset(images[index], height: 150, fit: BoxFit.cover),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Imagen ${index + 1}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
