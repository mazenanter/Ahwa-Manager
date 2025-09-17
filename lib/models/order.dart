import 'package:smart_ahwa_manager/models/drink.dart';

enum OrderStatus { pending, completed }

class Order {
  final String orderId;
  final String customerName;
  final Drink drink;
  OrderStatus status;
  final String specialInstructions;
  Order({
    required this.orderId,
    required this.customerName,
    required this.drink,
    this.status = OrderStatus.pending,
    this.specialInstructions = '',
  });

  void markAsCompleted() {
    status = OrderStatus.completed;
  }
}
