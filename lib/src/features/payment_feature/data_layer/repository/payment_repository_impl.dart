import 'package:dartz/dartz.dart';
import 'package:payment_app/src/core/errors/exceptions.dart';
import 'package:payment_app/src/core/errors/failures.dart';
import 'package:payment_app/src/features/payment_feature/data_layer/models/order_registration_model.dart';
import 'package:payment_app/src/features/payment_feature/data_layer/models/payment_model.dart';
import '../../../../core/network_info/cache_info.dart';
import '../../../../core/network_info/internet_checker_info.dart';
import '../../../../utils/constants/cache_keys.dart';
import '../../domain_layer/entities/order_registration_entity.dart';
import '../../domain_layer/entities/payment_entity.dart';
import '../../domain_layer/repository/payment_repository.dart';
import '../data_source/remote_data_source.dart';

typedef FutureStringMethod = Future<String> Function();

class PaymentRepositoryImpl extends PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;
  final CacheInfo cacheInfo;
  final InternetCheckerInfo internetCheckerInfo;

  PaymentRepositoryImpl(
      {required this.remoteDataSource,
      required this.cacheInfo,
      required this.internetCheckerInfo});

  @override
  Future<Either<Failure, String>> auth() async {
    return await _organizeFutureFunction(() {
      return remoteDataSource.auth();
    }, caching: true, key: authTokenKey);
  }

  @override
  Future<Either<Failure, String>> orderRegistration(
      {required OrderRegistrationEntity registrationEntity}) async {
    final List<ItemModel> items = registrationEntity.items
        .map((e) => ItemModel(
            name: e.name,
            amountCents: e.amountCents,
            description: e.description,
            quantity: e.quantity))
        .toList();
    final OrderRegistrationModel orderRegistrationModel =
        OrderRegistrationModel(
      authToken: registrationEntity.authToken,
      amountCents: registrationEntity.amountCents,
      deliveryNeeded: registrationEntity.deliveryNeeded,
      items: items,
    );
    return await _organizeFutureFunction(() {
      return remoteDataSource.orderRegistration(
          orderRegistrationModel: orderRegistrationModel);
    }, caching: true, key: orderIdKey);
  }

  @override
  Future<Either<Failure, String>> getPaymentKey(
      {required PaymentEntity paymentEntity}) async {
    final BillingDataModel billingModel = BillingDataModel(
        email: paymentEntity.billingData.email,
        firstName: paymentEntity.billingData.firstName,
        lastName: paymentEntity.billingData.lastName,
        phoneNumber: paymentEntity.billingData.phoneNumber);
    final PaymentModel paymentModel = PaymentModel(
        authToken: paymentEntity.authToken,
        amountCents: paymentEntity.amountCents,
        expiration: paymentEntity.expiration,
        orderId: paymentEntity.orderId,
        billingData: billingModel,
        currency: paymentEntity.currency,
        integrationId: paymentEntity.integrationId);
    return await _organizeFutureFunction(() {
      return remoteDataSource.getPaymentKey(paymentModel: paymentModel);
    }, caching: true, key: cardPaymentTokenKey);
  }

  @override
  Future<Either<Failure, Unit>> kioskPayment() {
    // TODO: implement kioskPayment
    throw UnimplementedError();
  }

  Future<Either<Failure, String>> _organizeFutureFunction(
      FutureStringMethod method,
      {bool? caching,
      String? key}) async {
    if (await internetCheckerInfo.isConnected) {
      try {
        String result = await method();
        if (caching != false) {
          await cacheInfo.setStringData(key: key!, value: result);
        }
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
