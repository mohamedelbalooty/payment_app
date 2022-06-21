// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
//
// abstract class NetworkInfo {
//   Future<dynamic> get({required String url, Options? options});
//
//   Future<dynamic> post(
//       {required String url, dynamic data, Options? options});
//
//   Future<dynamic> put(
//       {required String url, dynamic data, Options? options});
//
//   Future<dynamic> delete({required String url, dynamic data, Options? options});
// }
//
// class NetworkInfoImplWithDio implements NetworkInfo {
//   final Dio dio;
//
//   NetworkInfoImplWithDio({required this.dio});
//
//   @override
//   Future<Response> get({required String url, Options? options}) async {
//     return await dio.get(url, options: options);
//   }
//
//   @override
//   Future<Response> post(
//       {required String url, required dynamic data, Options? options}) async {
//     return await dio.post(url, data: data!, options: options);
//   }
//
//   @override
//   Future<Response> put(
//       {required String url, required dynamic data, Options? options}) async {
//     return await dio.put(url, data: data!, options: options);
//   }
//
//   @override
//   Future<Response> delete(
//       {required String url, dynamic data, Options? options}) async {
//     return await dio.delete(url, data: data, options: options);
//   }
// }
//
// class NetworkInfoImplWithHttp implements NetworkInfo {
//   Uri uri({required String url}) => Uri.parse(url);
//
//   @override
//   Future<http.Response> delete(
//       {required String url, data, Options? options}) async {
//     // TODO: implement delete
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<http.Response> get(
//       {required String url,
//       Options? options,
//       Map<String, String>? headers}) async {
//     return await http.get(uri(url: url), headers: headers);
//   }
//
//   @override
//   Future<http.Response> post(
//       {required String url,
//       required data,
//       Options? options,
//       Map<String, String>? headers,
//       required dynamic body}) async {
//     return await http.post(uri(url: url), headers: headers, body: body);
//   }
//
//   @override
//   Future<http.Response> put(
//       {required String url, required data, Options? options}) async {
//     // TODO: implement put
//     throw UnimplementedError();
//   }
// }
//
// // class NetworkInfoImplWithHttp implements NetworkInfo {
// //   Uri uri({required String url}) => Uri.parse(url);
// //
// //   @override
// //   Future<http.Response> get({required String url, Map<String, String>? headers, }) async {
// //     return await http.get(uri(url: url), headers: headers,);
// //   }
// //
// //   @override
// //   Future<http.Response> post(
// //       {required String url, Map<String, String>? headers, required dynamic body,}) async {
// //     return await http.post(uri(url: url), headers: headers, body: body);
// //   }
// //
// //   @override
// //   Future<http.Response> put(
// //       {String? url, Map<String, String>? headers, dynamic body}) async {
// //     return await http.put(uri(url: url!), headers: headers, body: body);
// //   }
// //
// //   @override
// //   Future<http.Response> delete(
// //       {String? url, Map<String, String>? headers, dynamic body}) async {
// //     return await http.delete(uri(url: url!), headers: headers, body: body);
// //   }
// // }
