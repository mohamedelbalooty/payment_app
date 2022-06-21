import 'package:dartz/dartz.dart';
import 'package:payment_app/src/core/errors/failures.dart';
import 'package:payment_app/src/features/payment_feature/domain_layer/entities/order_registration_entity.dart';
import 'package:payment_app/src/features/payment_feature/domain_layer/entities/payment_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, String>> auth();

  Future<Either<Failure, String>> orderRegistration({required OrderRegistrationEntity registrationEntity});

  Future<Either<Failure, String>> getPaymentKey({required PaymentEntity paymentEntity});

  Future<Either<Failure, Unit>> kioskPayment();
}
