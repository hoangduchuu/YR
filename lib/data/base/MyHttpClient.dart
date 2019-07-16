import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:your_reward_user/entity/RespErrorEntity.dart';

class MyHttpClient {
  MyHttpClient._privateConstructor();

  static final MyHttpClient _instance = MyHttpClient._privateConstructor();

  static MyHttpClient get instance => _instance;

  //get unauthorized
  Future<String> get(String url, Map<String, String> header, Map<String, String> params) async {
    Uri uri = Uri.parse(url);
    final newUri = uri.replace(queryParameters: params);
    var response = await http.get(newUri, headers: header);
    return response.body;
  }

  //post unauthorized with json data
  Future<String> post(String url, Map<String, String> header, String jsonBody) async {
    var response = await http.post(url, headers: header, body: jsonBody);
    return response.body;
  }

  Future<String> patch(String url, Map<String, String> header, String jsonBody) async {
    var response = await http.patch(url, headers: header, body: jsonBody);
    return response.body;
  }

  //post unauthorized with json data
  // https://stackoverflow.com/questions/52276158/file-is-not-a-subtype-of-type-string-in-type-cast
  Future<String> uploadFile(String url, File file) async {
    var dio = new Dio();

    try {
      ByteData byteData = await rootBundle.load(file.path);
      List<int> imageData = byteData.buffer.asUint8List();
      UploadFileInfo fileInfo = UploadFileInfo.fromBytes(imageData, "${DateTime.now().millisecond}.jpg");
      try {
        FormData formData = new FormData.from({"image": fileInfo});
        var response = await dio.post(url, data: formData);
        return response.toString();
      } catch (e) {
        return uploadEntityToJson(ErrorEntity(
            name: e.toString(), message: e.toString(), className: e.toString(), errors: e.toString(), code: 400));
      }
    } catch (e) {
      return uploadEntityToJson(ErrorEntity(
          name: e.toString(), message: e.toString(), className: e.toString(), errors: e.toString(), code: 400));
    }
  }
}
