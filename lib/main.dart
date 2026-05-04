// no ai dipake buat ini. kalo layoutnya mirip kayak ai, jangan salahin ana.
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PokeDexApp());
}

class PokeDexApp extends StatelessWidget {
  const PokeDexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeDex Silph Co.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA), // Putih kebiruan yang adem
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}