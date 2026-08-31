
import 'package:dawak/feature/order/domain/entity/delivry_entity.dart';

class DeliveryModel extends DeliveryEntity {
  const DeliveryModel({
    required super.id,
    required super.userId,
    required super.vehicleType,
    required super.vehicleNumber,
    required super.isAvailable,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      id: json['id'],
      userId: json['user_id'],
      vehicleType: json['vehicle_type'],
      vehicleNumber: json['vehicle_number'],
      isAvailable: json['is_available'],
    );
  }
}