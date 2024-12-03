import 'package:dio/dio.dart';
import 'package:project_nxt_professional/core/datasource/remote/print_interceptor.dart';
import 'package:project_nxt_professional/core/datasource/remote/session_interceptor.dart';

import '../local/local.dart';
import 'dio_header_interceptor.dart';

class DioClient {
  bool _isUnitTest = false;
  late Dio _dio;
  final PrefHelper _prefHelper;
  // late DioCancelTokens cancelTokens;

  DioClient(this._prefHelper, {bool isUnitTest = false}) {
    // cancelTokens = DioCancelTokens();
    _isUnitTest = isUnitTest;

    _dio = _createDio();

    if (!_isUnitTest) {
      _dio.interceptors.add(SessionExpiredInterceptor(_prefHelper));
      _dio.interceptors.add(DioHeaderInterceptor(_prefHelper));
      _dio.interceptors.add(DioPrintInterceptor());
    }
  }

  Dio get dio => _dio;

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: "https://revamp-api-dev.projectnxt.app/v1/",
          receiveTimeout: const Duration(seconds: 90),
          connectTimeout: const Duration(seconds: 90),
          validateStatus: (int? status) {
            return status! > 0;
          },
        ),
      );

  Future<Response> getRequest(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    // try {
    return await dio.get(url, queryParameters: queryParameters);
    // } on DioException catch (e) {
    // if (e.type == DioErrorType.connectionError) {
    //   AppRouter.shellNavigatorKey.currentContext!.push(kInternetConnection,
    //       extra: () async {
    //     await dio.get(url, queryParameters: queryParameters);
    //   });
    // } else {}
    // throw ServerFailure(e.message.toString());
    // }
  }

  Future<Response> postRequest(String url, {dynamic data, dynamic header}) async {
    // try {
    return await dio.post(
      url,
      data: data,
      options: header == null ? null : Options(headers: header),
    );

    //   if (response.statusCode == 201 || response.statusCode == 200) {
    //     return right(response);
    //   } else {
    //     throw DioException;
    //   }
    // } catch (e) {
    //   if (e is DioException) {
    //     throw ServerFailure.fromDioError(e);
    //   }
    // }
  }

  Future<Response> putRequest(String url, {dynamic data, dynamic header}) async {
    // try {
    return await dio.put(url,
        data: data,
        options: header == null
            ? null
            : Options(
                headers: header,
              ));
    // } on DioException catch (e, trace) {
    //   throw ServerException(e.message);
    // }
  }

  Future<Response> patchRequest(String url, {dynamic data, dynamic header}) async {
    // try {
    return await dio.patch(url,
        data: data,
        options: header == null
            ? null
            : Options(
                headers: header,
              ));
    // } on DioException catch (e, trace) {
    //   throw ServerException(e.message);
    // }
  }

  Future<Response> deleteRequest(String url, {dynamic data, dynamic header}) async {
    // try {
    return await dio.delete(url,
        data: data,
        options: header == null
            ? null
            : Options(
                headers: header,
              ));
    // } on DioException catch (e, trace) {
    //   throw ServerException(e.message);
    // }
  }

  Future<Response> uploadFile(String url, String filePath) async {
    // try {
    FormData formData = FormData.fromMap(
      {
        "file": await MultipartFile.fromFile(filePath),
      },
    );
    return await dio.post(url, data: formData);
    // } on DioException catch (e, trace) {
    //   throw ServerException(e.message);
    // }
  }
}
