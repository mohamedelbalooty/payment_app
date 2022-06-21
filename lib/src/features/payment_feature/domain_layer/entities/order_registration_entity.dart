import 'package:equatable/equatable.dart';

class OrderRegistrationEntity extends Equatable{
  const OrderRegistrationEntity({
    required this.authToken,
    required this.deliveryNeeded,
    required this.amountCents,
    required this.items,
  });

  final String authToken;
  final String deliveryNeeded;
  final String amountCents;
  final List<ItemEntity> items;

  @override
  List<Object?> get props => [authToken, deliveryNeeded, amountCents, items];
}

class ItemEntity extends Equatable{
  const ItemEntity({
    required this.name,
    required this.amountCents,
    required this.description,
    required this.quantity,
  });

  final String name;
  final String amountCents;
  final String description;
  final String quantity;

  @override
  List<Object?> get props => [name, amountCents, description, quantity];
}
