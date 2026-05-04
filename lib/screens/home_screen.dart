import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/pokemon_card.dart';
import '../data/pokemon_data.dart';
import 'compare_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    Widget getBody() {
      switch (_selectedIndex) {
        case 1:
          return const CompareScreen();
        case 2:
          return const FavoritesScreen();
        default:
          return _buildMainHome();
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Stack(
        children: [
          getBody(),
          Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 60,
                width: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFF2D3436),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(Icons.grid_view_rounded, 0),
                    _buildNavItem(Icons.balance_rounded, 1),
                    _buildNavItem(Icons.favorite_rounded, 2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.white24,
        size: 24,
      ),
      onPressed: () => setState(() => _selectedIndex = index),
    );
  }

  Widget _buildMainHome() {
    final filteredList = PokemonData.allPokemon.where((p) {
      if (selectedCategory == 'All') return true;
      if (selectedCategory == 'Favs') return p.isFavorite;
      return p.types.contains(selectedCategory);
    }).toList();

    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'POKÉ-LIST',
                style: GoogleFonts.pressStart2p(
                  fontSize: 18,
                  color: const Color(0xFF2D3436),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'dibikin sama binar 9a buat ujian',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFFAEAEAE),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              'All',
              'Favs',
              'Grass',
              'Fire',
              'Water',
              'Electric',
              'Ghost',
              'Dragon',
              'Psychic'
            ].map((type) {
              bool isSelected = type == selectedCategory;
              return GestureDetector(
                onTap: () => setState(() => selectedCategory = type),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.redAccent : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? Colors.redAccent : Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    type,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.72,
            ),
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              return PokemonCard(
                pokemon: filteredList[index],
                onFavoriteToggle: () => setState(() {}),
              );
            },
          ),
        ),
      ],
    );
  }
}