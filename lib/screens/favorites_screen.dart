import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/pokemon_card.dart';
import '../data/pokemon_data.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    // Baris ini sangat penting: mengambil data terbaru dari PokemonData
    final favoriteList = PokemonData.allPokemon.where((p) => p.isFavorite).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'MY COLLECTION',
          style: GoogleFonts.pressStart2p(
            fontSize: 16,
            color: const Color(0xFF2D3436),
          ),
        ),
      ),
      body: favoriteList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  Text(
                    'No favorite cards yet!',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.72,
              ),
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                return PokemonCard(
                  pokemon: favoriteList[index],
                  // Fungsi ini memastikan jika kita UNFAVORITE di sini, UI langsung update
                  onFavoriteToggle: () => setState(() {}),
                );
              },
            ),
    );
  }
}