import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/main_page.dart';
import 'pages/info_page.dart';
import 'pages/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar imagen de fondo desde SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final backgroundImage = prefs.getString('backgroundImage') ?? 'assets/images/diablo.jpg';

  runApp(MyApp(backgroundImage: backgroundImage));
}

class MyApp extends StatelessWidget {
  final String backgroundImage;

  const MyApp({super.key, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/info': (context) => InfoPage(),
        '/settings': (context) => SettingsPage(),

      },
    );
  }
}
