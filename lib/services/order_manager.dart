import 'package:flutter/widgets.dart';
import 'package:smart_ahwa_manager/models/order.dart';

class OrderManager {
  static final OrderManager _instance = OrderManager._internal();
  factory OrderManager() {
    return _instance;
  }
  OrderManager._internal();
  final ValueNotifier<List<Order>> orders = ValueNotifier([]);
  List<Order> get getOrders => List.unmodifiable(orders.value);
  void addOrder(Order order) {
    orders.value = [...orders.value, order];
  }

  void completeOrder(String orderId) {
    var order = orders.value.firstWhere((o) => o.orderId == orderId);
    order.markAsCompleted();
    orders.value = [...orders.value];
  }

  List<Order> get pendingOrders =>
      orders.value
          .where((order) => order.status == OrderStatus.pending)
          .toList();
  List<Order> get completedOrders =>
      orders.value
          .where((order) => order.status == OrderStatus.completed)
          .toList();
}
