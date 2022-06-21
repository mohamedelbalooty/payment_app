import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  const PaymentEntity({
    required this.authToken,
    required this.amountCents,
    required this.expiration,
    required this.orderId,
    required this.billingData,
    required this.currency,
    required this.integrationId,
  });

  final String authToken;
  final String amountCents;
  final int expiration;
  final String orderId;
  final BillingDataEntity billingData;
  final String currency;
  final int integrationId;

  @override
  List<Object?> get props => [
        authToken,
        amountCents,
        expiration,
        orderId,
        billingData,
        currency,
        integrationId
      ];
}

class BillingDataEntity extends Equatable {
  const BillingDataEntity({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  @override
  List<Object?> get props => [email, firstName, lastName, phoneNumber];
}
