import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_nxt_professional/core/datasource/remote/dio_error.dart';

Future<Either<ServerFailure, T>> callRequest<T>(Future<dynamic> Function() request,
    [T Function(dynamic)? fromJsonT]) async {
  try {
    final response = await request();
    int statusCode = response.statusCode;

    if (statusCode == 200 || statusCode == 201) {
      return fromJsonT != null ? right(fromJsonT!.call(response.data)) : right(response);
    } else {
      Map<String, dynamic> errorHandler = response.data as Map<String, dynamic>;
      return left(
        ServerFailure.fromResponse(
          statusCode,
          errorHandler['message'].runtimeType == String ? errorHandler['message'] : errorHandler['message'][0],
        ),
      );
    }
  } on DioException catch (e) {
    return left(ServerFailure.fromDioError(e));
  }
}
