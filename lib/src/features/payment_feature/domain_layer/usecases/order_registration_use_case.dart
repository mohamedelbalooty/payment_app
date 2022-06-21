import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/order_registration_entity.dart';
import '../repository/payment_repository.dart';

class OrderRegistrationUseCase {
  final PaymentRepository repository;

  OrderRegistrationUseCase({required this.repository});

  Future<Either<Failure, String>> call(
      {required OrderRegistrationEntity registrationEntity}) async {
    return await repository.orderRegistration(
        registrationEntity: registrationEntity);
  }
}
