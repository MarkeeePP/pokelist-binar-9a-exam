import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/pokemon.dart';

class DetailScreen extends StatefulWidget {
  final Pokemon pokemon;
  const DetailScreen({super.key, required this.pokemon});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2D3436)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.pokemon.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.pokemon.isFavorite ? Colors.red : const Color(0xFF2D3436),
            ),
            onPressed: () {
              setState(() {
                widget.pokemon.isFavorite = !widget.pokemon.isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF1C40F).withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFD4AF37), width: 2),
              ),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(widget.pokemon.image, fit: BoxFit.contain),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    widget.pokemon.name.toUpperCase(),
                    style: GoogleFonts.kanit(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF2D3436),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("BASE STATS", style: GoogleFonts.kanit(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 15),
                        _buildStatRow("HP", widget.pokemon.stats['HP']! / 150, Colors.redAccent),
                        _buildStatRow("ATK", widget.pokemon.stats['Atk']! / 150, Colors.orangeAccent),
                        _buildStatRow("DEF", widget.pokemon.stats['Def']! / 150, Colors.blueAccent),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, double val, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(width: 40, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: LinearProgressIndicator(value: val, color: color, backgroundColor: Colors.grey.shade200, minHeight: 8)),
        ],
      ),
    );
  }
}