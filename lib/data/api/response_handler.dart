import 'package:flutter_test_task/data/api/response_exception.dart';
import 'package:http/http.dart' as http;

import 'response_result.dart';

abstract class ResponseHandler {
  static Future<Success> handleResponse(Future<http.Response> Function() request) async {
    try {
      final response = await request.call();
      final statusCode = response.statusCode;
      final responseBody = response.body;
      late Success result;
      if (statusCode == 200) {
        result = Success(data: responseBody);
      } else {
        throw UnknownException('$statusCode - ${responseBody.toString()}')
            .message;
      }
      return result;
    } catch (e) {
      throw UnknownException(e.toString()).message;
    }
  }
}
