import 'dart:io';

import 'package:http/http.dart' as http;



class MyHttpClient{
  //get unauthorized
  Future<String> get(String url,
                                Map<String, String> header,
                                Map<String, String> params) async {
    Uri uri = Uri.parse(url);
    final newUri = uri.replace(queryParameters: params);
    var response = await http.get(newUri, headers: header);
    return response.body;
  }

  //post unauthorized with json data
  Future<String> post(String url, Map<String, String> header, String jsonBody) async{
    var response = await http.post(url, headers: header, body: jsonBody);
    return response.body;
  }




}