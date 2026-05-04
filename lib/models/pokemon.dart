class Pokemon {
  final String name;
  final String id;
  final List<String> types;
  final String role;
  final String image;
  final Map<String, int> stats;
  final String ability;
  final List<String> weaknesses;
  final String description;
  final Map<String, String> evolution;
  final List<Partner> suitablePartners;
  bool isFavorite;

  Pokemon({
    required this.name,
    required this.id,
    required this.types,
    required this.role,
    required this.image,
    required this.stats,
    required this.ability,
    required this.weaknesses,
    required this.description,
    required this.evolution,
    required this.suitablePartners,
    this.isFavorite = false,
  });
}

class Partner {
  final String name;
  final String description;

  Partner(this.name, this.description);
}