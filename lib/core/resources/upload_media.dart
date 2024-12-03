import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:project_nxt_professional/core/datasource/local/local.dart';
import 'package:project_nxt_professional/core/datasource/remote/dio_client.dart';

import '../../locator.dart';

class UploadMedia {
  static Future<List<String>> uploadMedia(
    List<File> files, {
    CancelToken? cancelToken,
    void Function(int fileNum, int progress, int total)? onProgress,
  }) async {
    List<String> fileNames = [];
    var dioClient = sl<DioClient>();
    var prefManager = sl<PrefHelper>();

    for (var i = 0; i < files.length; i++) {
      if (cancelToken?.isCancelled ?? false) {
        throw 'cancelled';
      }
      final res = await dioClient.getRequest(
        "s3?folder=${prefManager.userID}&filename=${files[i].path}&contentType=${lookupMimeType(files[i].path)}",
      );

      final dio = Dio();

      if (res.statusCode == 200) {
        var fileBytes = await convertFileToBinary(files[i].path);
        final uploadedUrl =
            await dio.put(res.data, data: fileBytes, cancelToken: cancelToken, onSendProgress: (count, total) {
          onProgress?.call(i, count, total);
        },
                options: Options(
                  headers: {
                    "Content-Type": lookupMimeType(files[i].path),
                  },
                ));
        if (uploadedUrl.statusCode == 200 || uploadedUrl.statusCode == 201) {
          fileNames.add(res.data.toString().split("?")[0]);
        }
      }
    }

    return fileNames;
  }

  static Future<Uint8List> convertFileToBinary(String fileName) async {
    Uint8List fileBytes = await File(fileName).readAsBytes();
    return fileBytes;
  }
}
