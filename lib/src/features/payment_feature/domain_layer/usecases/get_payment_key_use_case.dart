import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/payment_entity.dart';
import '../repository/payment_repository.dart';

class GetPaymentKeyUseCase {
  final PaymentRepository repository;

  GetPaymentKeyUseCase({required this.repository});

  Future<Either<Failure, String>> call({required PaymentEntity paymentEntity}) async {
    return await repository.getPaymentKey(paymentEntity: paymentEntity);
  }
}
