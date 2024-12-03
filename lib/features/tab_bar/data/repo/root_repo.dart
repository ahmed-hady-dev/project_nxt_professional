import 'package:dartz/dartz.dart';
import 'package:project_nxt_professional/core/datasource/remote/api_handler.dart';
import 'package:project_nxt_professional/core/datasource/remote/dio_client.dart';
import 'package:project_nxt_professional/core/datasource/remote/dio_error.dart';
import 'package:project_nxt_professional/features/tab_bar/data/model/user.dart';
import 'package:project_nxt_professional/features/tab_bar/data/model/vertical.dart';

import '../model/unreads.dart';

abstract class RootRepo {
  Future<Either<ServerFailure, Verticals>> getVerticals();
  Future<Either<ServerFailure, Unread>> getUnread();
  Future<Either<ServerFailure, NxtUser>> gerCurrentUser();
}

class RootRepoImpl implements RootRepo {
  final DioClient dioClient;
  RootRepoImpl(this.dioClient);

  @override
  Future<Either<ServerFailure, Verticals>> getVerticals() {
    return callRequest(
      () => dioClient.getRequest('personality/verticals'),
      (data) => Verticals.from(data.map((x) => Vertical.fromJson(x))),
    );
  }

  @override
  Future<Either<ServerFailure, Unread>> getUnread() {
    return callRequest(
      () => dioClient.getRequest("user/unreads"),
      (data) => Unread.fromJson(data),
    );
  }

  @override
  Future<Either<ServerFailure, NxtUser>> gerCurrentUser() {
    return callRequest(
      () => dioClient.getRequest("user/me"),
      (data) => NxtUser.fromJson(data),
    );
  }
}
