import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment_app/src/core/errors/exceptions.dart';
import 'package:payment_app/src/features/payment_feature/data_layer/models/order_registration_model.dart';
import '../../../../utils/constants/api_constants.dart';
import '../models/payment_model.dart';

abstract class PaymentRemoteDataSource {
  Future<String> auth();

  Future<String> orderRegistration(
      {required OrderRegistrationModel orderRegistrationModel});

  Future<String> getPaymentKey({required PaymentModel paymentModel});

  Future<Unit> kioskPayment();
}

class PaymentRemoteDataSourceImplWithDio extends PaymentRemoteDataSource {
  final Dio dio;

  PaymentRemoteDataSourceImplWithDio({required this.dio});

  @override
  Future<String> auth() async {
    final Map<String, dynamic> data = {'api_key': apiKey};
    final Response response = await dio.post('auth/tokens', data: data);
    if (response.statusCode == 201) {
      Map<String, dynamic> jsonData = response.data;
      String token = jsonData['token'];
      return Future.value(token);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> orderRegistration(
      {required OrderRegistrationModel orderRegistrationModel}) async {
    final Response response = await dio.post('ecommerce/orders',
        data: orderRegistrationModel.toMap());
    if (response.statusCode == 201) {
      Map<String, dynamic> jsonData = response.data;
      String orderId = jsonData['id'];
      return Future.value(orderId);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> getPaymentKey({required PaymentModel paymentModel}) async {
    final Response response =
        await dio.post('acceptance/payment_keys', data: paymentModel.toMap());
    if (response.statusCode == 201) {
      Map<String, dynamic> jsonData = response.data;
      String orderId = jsonData['token'];
      return Future.value(orderId);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> kioskPayment() async {
    // TODO: implement kioskPayment
    throw UnimplementedError();
  }
}
