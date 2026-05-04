import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/pokemon_data.dart';
import '../models/pokemon.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  Pokemon pokemon1 = PokemonData.allPokemon[0];
  Pokemon pokemon2 = PokemonData.allPokemon[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'COMPARE',
          style: GoogleFonts.pressStart2p(
            fontSize: 18,
            color: const Color(0xFF2D3436),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                _buildPicker(pokemon1, (val) => setState(() => pokemon1 = val)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("VS", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                ),
                _buildPicker(pokemon2, (val) => setState(() => pokemon2 = val)),
              ],
            ),
            const SizedBox(height: 30),
            _buildStatComparison(),
          ],
        ),
      ),
    );
  }

  Widget _buildPicker(Pokemon selected, Function(Pokemon) onSelect) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF1C40F),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(selected.image, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 10),
          DropdownButton<Pokemon>(
            value: selected,
            isExpanded: true,
            underline: const SizedBox(),
            items: PokemonData.allPokemon.map((p) {
              return DropdownMenuItem(value: p, child: Text(p.name, style: const TextStyle(fontSize: 12)));
            }).toList(),
            onChanged: (val) => onSelect(val!),
          ),
        ],
      ),
    );
  }

  Widget _buildStatComparison() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        children: [
          _compareRow("HP", pokemon1.stats['HP']!, pokemon2.stats['HP']!),
          _compareRow("ATK", pokemon1.stats['Atk']!, pokemon2.stats['Atk']!),
          _compareRow("DEF", pokemon1.stats['Def']!, pokemon2.stats['Def']!),
          _compareRow("SPD", pokemon1.stats['Speed']!, pokemon2.stats['Speed']!),
        ],
      ),
    );
  }

  Widget _compareRow(String label, int val1, int val2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(val1.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Expanded(
                child: RotatedBox(
                  quarterTurns: 2,
                  child: LinearProgressIndicator(value: val1 / 150, color: Colors.redAccent, backgroundColor: Colors.grey.shade100),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: LinearProgressIndicator(value: val2 / 150, color: Colors.blueAccent, backgroundColor: Colors.grey.shade100),
              ),
              const SizedBox(width: 10),
              Text(val2.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}