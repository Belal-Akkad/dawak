import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure implements Exception {
  final int? statusCode;

  const ServerFailure({required String message, this.statusCode})
    : super(message);
}

ServerFailure handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return const ServerFailure(
        message: 'انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى لاحقًا.',
      );

    case DioExceptionType.sendTimeout:
      return const ServerFailure(
        message: 'انتهت مهلة إرسال الطلب. يرجى التحقق من اتصال الإنترنت.',
      );

    case DioExceptionType.receiveTimeout:
      return const ServerFailure(
        message: 'انتهت مهلة استلام البيانات. يرجى التحقق من اتصال الشبكة.',
      );

    case DioExceptionType.badCertificate:
      return const ServerFailure(
        message: 'شهادة الأمان غير صالحة. تعذر التحقق من الخادم.',
      );

    case DioExceptionType.cancel:
      return const ServerFailure(message: 'تم إلغاء الطلب.');

    case DioExceptionType.connectionError:
      return const ServerFailure(
        message: 'تعذر الاتصال بالخادم. يرجى المحاولة مرة أخرى لاحقًا.',
      );

    case DioExceptionType.unknown:
      return const ServerFailure(
        message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى لاحقًا.',
      );

    case DioExceptionType.badResponse:
      return _handleBadResponse(e);

    case DioExceptionType.transformTimeout:
      return const ServerFailure(
        message: 'انتهت مهلة معالجة البيانات. يرجى المحاولة مرة أخرى لاحقًا.',
      );
  }
}



ServerFailure _handleBadResponse(DioException e) {
  final int? status = e.response?.statusCode;
  final dynamic data = e.response?.data;

  if (status != null && status >= 500) {
    return ServerFailure(
      message: 'حدث خطأ في الخادم. يرجى المحاولة مرة أخرى لاحقًا.',
      statusCode: status,
    );
  }



  if (data is Map<String, dynamic>) {
    final msg = data['message'];

    if (msg is String && msg.isNotEmpty) {
      return ServerFailure(message: msg, statusCode: status);
    }
  }

  switch (status) {
    case 400:
      return ServerFailure(message: 'الطلب غير صالح.', statusCode: status);

    case 401:
      return ServerFailure(
        message: 'بيانات تسجيل الدخول غير صحيحة.',
        statusCode: status,
      );

    case 403:
      return ServerFailure(
        message: 'ليس لديك صلاحية للوصول.',
        statusCode: status,
      );

    case 404:
      return ServerFailure(
        message: 'المورد المطلوب غير موجود.',
        statusCode: status,
      );

    case 409:
      return ServerFailure(message: 'حدث تعارض في الطلب.', statusCode: status);

    case 422:
      return ServerFailure(
        message: 'البيانات المدخلة غير صالحة. يرجى التحقق من المعلومات.',
        statusCode: status,
      );

    default:
      return ServerFailure(
        message: 'فشل تنفيذ الطلب.${status != null ? " [$status]" : ""}',
        statusCode: status,
      );
  }
}
