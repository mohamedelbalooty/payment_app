import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class NetworkInfo {
  Future<dynamic> get();

  Future<dynamic> post();

  Future<dynamic> put();

  Future<dynamic> delete();
}

class NetworkInfoImplWithDio implements NetworkInfo {
  final Dio dio;

  NetworkInfoImplWithDio({required this.dio});

  @override
  Future<Response> get({String? url, Options? options}) async {
    return await dio.get(url!, options: options);
  }

  @override
  Future<Response> post({String? url, dynamic data, Options? options}) async {
    return await dio.post(url!, data: data!, options: options);
  }

  @override
  Future<Response> put({String? url, dynamic data, Options? options}) async {
    return await dio.put(url!, data: data!, options: options);
  }

  @override
  Future<Response> delete({String? url, dynamic data, Options? options}) async {
    return await dio.delete(url!, data: data, options: options);
  }
}

class NetworkInfoImplWithHttp implements NetworkInfo {
  Uri uri({required String url}) => Uri.parse(url);

  @override
  Future<http.Response> get({String? url, Map<String, String>? headers}) async {
    return await http.get(uri(url: url!), headers: headers);
  }

  @override
  Future<http.Response> post(
      {String? url, Map<String, String>? headers, dynamic body}) async {
    return await http.post(uri(url: url!), headers: headers, body: body);
  }

  @override
  Future<http.Response> put(
      {String? url, Map<String, String>? headers, dynamic body}) async {
    return await http.put(uri(url: url!), headers: headers, body: body);
  }

  @override
  Future<http.Response> delete(
      {String? url, Map<String, String>? headers, dynamic body}) async {
    return await http.delete(uri(url: url!), headers: headers, body: body);
  }
}