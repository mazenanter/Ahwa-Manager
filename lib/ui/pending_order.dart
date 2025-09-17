import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/models/order.dart';
import 'package:smart_ahwa_manager/services/order_manager.dart';
import 'package:smart_ahwa_manager/widgets/app_card.dart';

class PendingOrder extends StatelessWidget {
  const PendingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pending Orders"),
        backgroundColor: const Color(0xff93501F),
        foregroundColor: Colors.white,
      ),
      body: ValueListenableBuilder<List<Order>>(
        valueListenable: OrderManager().orders,
        builder: (context, orders, _) {
          final pending = OrderManager().pendingOrders;
          if (pending.isEmpty) {
            return const Center(child: Text("No pending orders"));
          }
          return ListView.builder(
            itemCount: pending.length,
            itemBuilder: (context, index) {
              final order = pending[index];
              return AppCard(
                title: order.customerName,
                subtitle: order.drink.name,
                icon: Icons.check_circle_outline,
                iconColor: Colors.green,
                onTap: () => OrderManager().completeOrder(order.orderId),
              );
            },
          );
        },
      ),
    );
  }
}
