class ProductModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final String price;
  final int stock;
  final bool requiresPrescription;
  final String? usage;
  final String? dosage;
  final String? sideEffects;
  final String? warnings;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    this.stock = 10,
    this.requiresPrescription = false,
    this.usage,
    this.dosage,
    this.sideEffects,
    this.warnings,
  });

  int get unitPrice {
    final matches = RegExp(r'\d+').allMatches(price);
    final numbers = matches.map((match) => int.tryParse(match.group(0) ?? '')).whereType<int>().toList();
    if (numbers.isEmpty) return 0;
    return numbers.first;
  }

  String get displayPrice => '$unitPrice ل.س';
}
