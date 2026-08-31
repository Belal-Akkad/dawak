import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:dawak/core/error/failures.dart';
import 'package:dawak/feature/order/data/remote_data_source/orders_remote_data_source.dart';
import 'package:dawak/feature/order/domain/entity/order_details_entity.dart';
import 'package:dawak/feature/order/domain/repo/get_order_details_repo.dart';

class GetOrderDetailsRepositoryImpl implements GetOrderDetailsRepository {
  GetOrderDetailsRepositoryImpl(this.remoteDataSource);

  final OrdersRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, OrderDetailsEntity>> getOrderDetails(
    int orderId,
  ) async {
    try {
      final orderDetails = await remoteDataSource.getOrderDetails(orderId);

      return Right(orderDetails);
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