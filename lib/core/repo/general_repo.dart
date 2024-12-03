import 'package:dartz/dartz.dart';
import 'package:project_nxt_professional/core/datasource/remote/api_handler.dart';
import 'package:project_nxt_professional/core/datasource/remote/dio_client.dart';
import 'package:project_nxt_professional/core/model/saved_params.dart';

import '../datasource/remote/dio_error.dart';
import '../model/saved.dart';

abstract class GeneralRepo {
  Future<Either<ServerFailure, Saved>> saveItem(SavedParams params);
}

class GeneralRepoImpl implements GeneralRepo {
  final DioClient dio;

  GeneralRepoImpl({required this.dio});
  @override
  Future<Either<ServerFailure, Saved>> saveItem(SavedParams params) {
    return callRequest(
      () => dio.postRequest('/saved-item', data: params.toJson()),
      (data) => Saved.fromJson(data),
    );
  }
}
