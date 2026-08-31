import 'package:dartz/dartz.dart';
import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/cart/data/model/add_order_model.dart';
import 'package:dawak/feature/cart/data/remote_data_source/add_order_remote_data_source.dart';
import 'package:dawak/feature/cart/domain/entity/add_order_entity.dart';
import 'package:dawak/feature/cart/domain/repo/add_order_repo.dart';
import 'package:dio/dio.dart';

class AddOrderRepositoryImpl implements AddOrderRepository {
  final AddOrdersRemoteDataSource remoteDataSource;

  AddOrderRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> addOrder(AddOrderEntity order) async {
    try {
      final orderModel = AddOrderModel.fromEntity(order);

      await remoteDataSource.addOrder(orderModel);

      return const Right(null);
    } on DioException catch (e) {
      return Left(handleDioExceptions(e));
    } catch (_) {
      return const Left(
        ServerFailure(
          message: 'حدث خطأ في الخادم. يرجى المحاولة مرة أخرى لاحقًا.',
        ),
      );
    }
  }
}
