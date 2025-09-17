import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/models/order.dart';
import 'package:smart_ahwa_manager/services/order_manager.dart';
import 'package:smart_ahwa_manager/widgets/app_card.dart';

class CompletedOrder extends StatelessWidget {
  const CompletedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed Orders"),
        backgroundColor: const Color(0xff93501F),
        foregroundColor: Colors.white,
      ),
      body: ValueListenableBuilder<List<Order>>(
        valueListenable: OrderManager().orders,
        builder: (context, orders, _) {
          final completed = OrderManager().completedOrders;
          if (completed.isEmpty) {
            return const Center(child: Text("No completed orders"));
          }
          return ListView.builder(
            itemCount: completed.length,
            itemBuilder: (context, index) {
              final order = completed[index];
              return AppCard(
                title: order.customerName,
                subtitle: order.drink.name,
                icon: Icons.check_circle,
                iconColor: Colors.green,
              );
            },
          );
        },
      ),
    );
  }
}
