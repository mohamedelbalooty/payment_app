import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repository/payment_repository.dart';

class AuthUseCase {
  final PaymentRepository repository;

  AuthUseCase({required this.repository});

  Future<Either<Failure, String>> call() async {
    return await repository.auth();
  }
}
