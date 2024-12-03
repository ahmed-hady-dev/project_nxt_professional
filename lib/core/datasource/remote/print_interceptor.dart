import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioPrintInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String queryParameters = "";
    String headerMessage = "";

    try {
      options.headers.forEach((k, v) => headerMessage += '► $k: $v\n');
      options.queryParameters.forEach(
        (k, v) => debugPrint(
          queryParameters += '--> $k: $v',
        ),
      );
    } catch (_) {}
    try {
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final String prettyJson = encoder.convert(options.data);
      debugPrint(
        // ignore: unnecessary_null_comparison
        "REQUEST ► ︎ ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"${options.baseUrl}${options.path}"}\n\n"
        "Headers:\n"
        "$headerMessage\n"
        "❖ QueryParameters : $queryParameters\n"
        "Body: $prettyJson",
      );
    } catch (e) {
      debugPrint("Failed to extract json request $e");
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) async {
    debugPrint(
      "<-- ${dioError.message} ${dioError.response?.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : 'URL'}\n\n"
      "${dioError.response != null ? dioError.response!.data : 'Unknown Error'}",
    );

    super.onError(dioError, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String headerMessage = "";
    response.headers.forEach((k, v) => headerMessage += '► $k: $v\n');

    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String prettyJson = encoder.convert(response.data);
    debugPrint(
      "## Results : \n"
      "Response: $prettyJson",
    );
    super.onResponse(response, handler);
  }
}
