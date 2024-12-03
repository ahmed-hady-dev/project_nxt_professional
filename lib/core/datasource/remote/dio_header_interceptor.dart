import 'package:dio/dio.dart';

import '../local/local.dart';

class DioHeaderInterceptor extends Interceptor {
  final PrefHelper _prefManager;

  DioHeaderInterceptor(this._prefManager);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({'Authorization': 'Bearer ${_prefManager.token}'});
    options.headers.addAll({'Accept-Language': _prefManager.locale});

    super.onRequest(options, handler);
  }
}
