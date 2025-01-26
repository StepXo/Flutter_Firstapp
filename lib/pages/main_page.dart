import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? _backgroundImage;

  @override
  void initState() {
    super.initState();
    _loadBackgroundImage();
  }

  Future<void> _loadBackgroundImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _backgroundImage = prefs.getString('backgroundImage') ??
          'assets/images/diablo.jpg'; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _backgroundImage != null
              ? Image.asset(
                  _backgroundImage!,
                  fit: BoxFit.cover,
                )
              : Container(color: Colors.grey),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/info').then((_) {
                      _loadBackgroundImage();
                    });
                  },
                  child: Text('Informacion'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings').then((_) {
                      _loadBackgroundImage();
                    });
                  },
                  child: Text('Configuración'),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
