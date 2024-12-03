import 'package:dartz/dartz.dart';
import 'package:project_nxt_professional/core/datasource/remote/dio_error.dart';
import 'package:project_nxt_professional/core/model/api_response.dart';
import 'package:project_nxt_professional/features/choose_language/data/model/config.dart';

import '../../../../core/datasource/remote/api_handler.dart';
import '../../../../core/datasource/remote/dio_client.dart';

abstract class ConfigRepo {
  Future<Either<ServerFailure, ApiResponse<ConfigData>>> getAppData();
}

class ConfigRepoImpl implements ConfigRepo {
  final DioClient _dioClient;

  ConfigRepoImpl(this._dioClient);

  @override
  Future<Either<ServerFailure, ApiResponse<ConfigData>>> getAppData() async {
    return callRequest(
      () => _dioClient.getRequest("app-config"),
      (data) => ApiResponse<ConfigData>.fromJson(data, (json) => ConfigData.fromJson(json)),
    );
  }
}
