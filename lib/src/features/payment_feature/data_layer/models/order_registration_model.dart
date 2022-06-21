import '../../domain_layer/entities/order_registration_entity.dart';

class OrderRegistrationModel extends OrderRegistrationEntity {
  const OrderRegistrationModel(
      {required String authToken,
      required String deliveryNeeded,
      required String amountCents,
      required List<ItemModel> items})
      : super(
            authToken: authToken,
            deliveryNeeded: deliveryNeeded,
            amountCents: amountCents,
            items: items);

  factory OrderRegistrationModel.fromMap(Map<String, dynamic> json) =>
      OrderRegistrationModel(
        authToken: json["auth_token"],
        deliveryNeeded: json["delivery_needed"],
        amountCents: json["amount_cents"],
        items: List<ItemModel>.from(
            json["items"].map((x) => ItemModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "auth_token": authToken,
        "delivery_needed": deliveryNeeded,
        "amount_cents": amountCents,
        "items": List<dynamic>.from(items.map((x) => (x as ItemModel).toMap())),
      };
}

class ItemModel extends ItemEntity {
  const ItemModel(
      {required String name,
        required String amountCents,
        required String description,
        required String quantity})
      : super(
      name: name,
      amountCents: amountCents,
      description: description,
      quantity: quantity);

  factory ItemModel.fromMap(Map<String, dynamic> json) => ItemModel(
    name: json["name"],
    amountCents: json["amount_cents"],
    description: json["description"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "amount_cents": amountCents,
    "description": description,
    "quantity": quantity,
  };
}
