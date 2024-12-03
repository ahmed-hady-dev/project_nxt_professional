import 'package:dio/dio.dart';

import '../local/local.dart';

class SessionExpiredInterceptor extends Interceptor {
  final PrefHelper prefHelper;

  SessionExpiredInterceptor(this.prefHelper);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
    // print("In Interceptor");
    // if (response.statusCode != 200 || response.statusCode != 201) {
    //   throw ServerFailure(response.data['message']);
    // }
    if (response.statusCode == 503) {}
  }
}
