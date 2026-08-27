import 'package:dawak/core/constants/api_constants.dart';
import 'package:dawak/core/network/dio_client.dart';
import 'package:dawak/feature/profile/data/model/profile_model.dart';

class ProfileRemoteDataSource {
  ProfileRemoteDataSource({required DioClient dioClient})
    : _dioClient = dioClient;

  final DioClient _dioClient;

  Future<ProfileModel> getProfile() async {
    final response = await _dioClient.dio.get(ApiConstants.profileEndPoint);

    return ProfileModel.fromJson(response.data);
  }

  Future<ProfileModel> updateProfile({
    required String name,
    required String phone,
  }) async {
    final response = await _dioClient.dio.put(
      ApiConstants.updateProfileEndPoint,
      data: {'name': name, 'phone': phone},
    );

    return ProfileModel.fromJson(response.data['user']);
  }

  Future<void> logout() async {
    await _dioClient.dio.post(ApiConstants.logoutEndPoint);
  }

  Future<void> deleteAccount() async {
    try {
      await _dioClient.dio.delete(ApiConstants.deleteAccountEnpPoint);
    } catch (e) {
      rethrow;
    }
  }
}
