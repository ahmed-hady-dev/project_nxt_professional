import 'package:dio/dio.dart';

class ServerFailure {
  final String errorMessage;

  ServerFailure(this.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with the server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with the server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with the server");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to api server was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure("Internet connection failed");
      case DioExceptionType.unknown:
        return ServerFailure("Unexpected error, Please try again!");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, String? response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response ?? "Unexpected error, Please try again!");
    } else if (statusCode == 404) {
      return ServerFailure(response ?? "Your request Not Found");
    } else if (statusCode == 500) {
      return ServerFailure(response ?? "Internal Server Error");
    } else {
      return ServerFailure("Opps! There was an error, Please try again");
    }
  }
}
