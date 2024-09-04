import 'package:dio/dio.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/generics/resource.dart';

abstract class RemoteClientAdapter {
  Future<Resource<dynamic, Exception>> get({
    required String url,
    Map<String, dynamic>? body,
    bool sendToken = false,
  });
  Future<Resource<dynamic, Exception>> post({
    required String url,
    required Map<String, dynamic> body,
  });
}

class RemoteClientDioImplementation implements RemoteClientAdapter {
  final Dio dio = Dio();

  @override
  Future<Resource<dynamic, Exception>> get({
    required String url,
    Map<String, dynamic>? body,
    bool sendToken = false,
  }) async {
    try {
      final response = await dio.get(url, data: body);
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  @override
  Future<Resource<dynamic, Exception>> post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await dio.post(url, data: body);
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Resource<dynamic, Exception> _handleResponse(Response response) {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! <= 299) {
      return Resource.success(data: response.data);
    } else {
      return Resource.failed(
          error: Exception(response.statusMessage ?? "Unknown error"));
    }
  }

  Resource<dynamic, Exception> _handleError(Object exception) {
    if (exception is DioException && exception.response != null) {
      final errorMessage = exception.response?.data['error'];
      return Resource.failed(error: errorMessage);
    } else {
      return Resource.failed(
          error: Exception('Request failure: ${exception.toString()}'));
    }
  }
}
