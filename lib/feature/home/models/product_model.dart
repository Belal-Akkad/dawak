class ProductModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final String price;
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
    this.requiresPrescription = false,
    this.usage,
    this.dosage,
    this.sideEffects,
    this.warnings,
  });
}
