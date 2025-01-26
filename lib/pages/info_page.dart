import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String nombre = 'Kevin Leonardo Arias Orrego';
    final String correo = 'kariaso@unal.edu.co';
    final int edad = 23;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Información'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: $nombre',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Correo: $correo',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Edad: $edad años',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
