import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repository/payment_repository.dart';

class KioskPaymentUseCase {
  final PaymentRepository repository;

  KioskPaymentUseCase({required this.repository});

  Future<Either<Failure, Unit>> call() async {
    return await repository.kioskPayment();
  }
}
