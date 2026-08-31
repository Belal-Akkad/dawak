import 'package:dartz/dartz.dart';
import 'package:dawak/feature/order/data/remote_data_source/orders_remote_data_source.dart';
import 'package:dawak/feature/order/domain/entity/order_entity.dart';
import 'package:dawak/feature/order/domain/repo/get_orders_repo.dart';
import 'package:dio/dio.dart';

import 'package:dawak/core/error/failures.dart';

class GetOrdersRepositoryImpl implements GetOrdersRepository {
  GetOrdersRepositoryImpl(this.remoteDataSource);

  final OrdersRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      final orders = await remoteDataSource.getOrders();

      return Right(orders);
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