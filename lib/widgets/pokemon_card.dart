import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/pokemon.dart';
import '../screens/detail_screen.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback? onFavoriteToggle;

  const PokemonCard({super.key, required this.pokemon, this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    Color typeColor = _getTypeColor(pokemon.types.first);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(pokemon: pokemon)),
        ).then((_) {
          if (onFavoriteToggle != null) onFavoriteToggle!();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF1C40F).withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFD4AF37), width: 1.5),
        ),
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Text(
                  pokemon.name,
                  style: GoogleFonts.kanit(
                    color: const Color(0xFF2D3436),
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(pokemon.image, fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: typeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    pokemon.role.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: typeColor, 
                      fontSize: 8, 
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass': return Colors.green.shade700;
      case 'fire': return Colors.orange.shade800;
      case 'water': return Colors.blue.shade700;
      case 'electric': return Colors.amber.shade700;
      default: return Colors.blueGrey;
    }
  }
}