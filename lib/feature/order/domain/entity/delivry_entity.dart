class DeliveryEntity {
  final int id;
  final int userId;
  final String vehicleType;
  final String vehicleNumber;
  final bool isAvailable;

  const DeliveryEntity({
    required this.id,
    required this.userId,
    required this.vehicleType,
    required this.vehicleNumber,
    required this.isAvailable,
  });
}