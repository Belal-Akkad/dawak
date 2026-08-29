class DetailEntity {
  final int id;
  final int productId;
  final String type;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DetailEntity({
    required this.id,
    required this.productId,
    required this.type,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
}