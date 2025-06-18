import 'dart:convert';
import 'dart:io';

import 'package:flutter_viz/utils/AppCommon.dart';
import 'package:flutter_viz/utils/AppConstant.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

Map<String, String> buildHeaderTokens() {
  Map<String, String> header = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    HttpHeaders.cacheControlHeader: 'no-cache, private',
    HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
    'Access-Control-Allow-Headers': '*',
    'Access-Control-Allow-Origin': '*',
  };

  if (appStore.isLoggedIn) {
    header.putIfAbsent(HttpHeaders.authorizationHeader, () => 'Bearer ${getStringAsync(TOKEN)}');
  }
  return header;
}

Uri buildBaseUrl(String endPoint) {
  Uri url = Uri.parse(endPoint);
  if (!endPoint.startsWith('http')) url = Uri.parse('$baseURl$endPoint');
  return url;
}

Future<Response> buildHttpResponse(String endPoint, {HttpMethod method = HttpMethod.GET, Map? request, bool? isRecaptcha = false}) async {
  if (await isNetworkAvailable()) {
    var headers = buildHeaderTokens();
    Uri url;
    url = buildBaseUrl(endPoint);

    Response response;
    printLogData("buildHttpResponse : ${url.toString()}");
    printLogData("request : ${request.toString()}");

    try {
      if (method == HttpMethod.POST) {
        response = await http.post(url, body: jsonEncode(request), headers: headers);
      } else if (method == HttpMethod.DELETE) {
        response = await delete(url, headers: headers);
      } else if (method == HttpMethod.PUT) {
        response = await put(url, body: jsonEncode(request), headers: headers);
      } else {
        response = await get(url, headers: headers);
      }

      printLogData('Response ($method): ${response.statusCode} ${response.body}');

      return response;
    } catch (e) {
      printLogData('Response ($method): ${e.toString()}');
      throw errorSomethingWentWrong;
    }
  } else {
    throw errorInternetNotAvailable;
  }
}

@deprecated
Future<Response> getRequest(String endPoint) async => buildHttpResponse(endPoint);

@deprecated
Future<Response> postRequest(String endPoint, Map request) async => buildHttpResponse(endPoint, request: request, method: HttpMethod.POST);

Future handleResponse(Response response) async {
  if (!await isNetworkAvailable()) {
    throw errorInternetNotAvailable;
  }
  if (response.statusCode == 401) {
    LiveStream().emit(tokenStream, true);
    throw TokenException('Token Expired');
  }

  if (response.statusCode.isSuccessful()) {
    return jsonDecode(response.body);
  } else {
    try {
      var body = jsonDecode(response.body);

      throw parseHtmlString(body['message'])!;
    } on Exception catch (e) {
      log(e);
      throw errorSomethingWentWrong;
    }
  }
}

//region Common
enum HttpMethod { GET, POST, DELETE, PUT }

class TokenException implements Exception {
  final String message;

  const TokenException([this.message = ""]);

  String toString() => "FormatException: $message";
}
//endregion