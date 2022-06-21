import '../../domain_layer/entities/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  const PaymentModel({required String authToken,
    required String amountCents,
    required int expiration,
    required String orderId,
    required BillingDataModel billingData,
    required String currency,
    required int integrationId})
      : super(
      authToken: authToken,
      amountCents: amountCents,
      expiration: expiration,
      orderId: orderId,
      billingData: billingData,
      currency: currency,
      integrationId: integrationId);

  factory PaymentModel.fromMap(Map<String, dynamic> json) =>
      PaymentModel(
        authToken: json["auth_token"],
        amountCents: json["amount_cents"],
        expiration: json["expiration"],
        orderId: json["order_id"],
        billingData: BillingDataModel.fromMap(json["billing_data"]),
        currency: json["currency"],
        integrationId: json["integration_id"],
      );

  Map<String, dynamic> toMap() =>
      {
        "auth_token": authToken,
        "amount_cents": amountCents,
        "expiration": expiration,
        "order_id": orderId,
        "billing_data": (billingData as BillingDataModel).toMap(),
        "currency": currency,
        "integration_id": integrationId,
      };
}

class BillingDataModel extends BillingDataEntity {
  const BillingDataModel({required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    this.floor,
    this.street,
    this.building,
    this.shippingMethod,
    this.postalCode,
    this.city,
    this.country,
    this.apartment,
    this.state})
      : super(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber);

  final String? apartment;
  final String? floor;
  final String? street;
  final String? building;
  final String? shippingMethod;
  final String? postalCode;
  final String? city;
  final String? country;
  final String? state;

  factory BillingDataModel.fromMap(Map<String, dynamic> json) =>
      BillingDataModel(
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        apartment: json["apartment"],
        floor: json["floor"],
        street: json["street"],
        building: json["building"],
        shippingMethod: json["shipping_method"],
        postalCode: json["postal_code"],
        city: json["city"],
        country: json["country"],
        state: json["state"],
      );

  Map<String, dynamic> toMap() =>
      {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "apartment": apartment ?? 'NA',
        "floor": floor ?? 'NA',
        "street": street ?? 'NA',
        "building": building ?? 'NA',
        "shipping_method": shippingMethod ?? 'NA',
        "postal_code": postalCode ?? 'NA',
        "city": city ?? 'NA',
        "country": country ?? 'NA',
        "state": state ?? 'NA',
      };
}