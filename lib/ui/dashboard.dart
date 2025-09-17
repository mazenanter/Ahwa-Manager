import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/services/order_manager.dart';
import 'package:smart_ahwa_manager/ui/add_order.dart';
import 'package:smart_ahwa_manager/ui/completed_order.dart';
import 'package:smart_ahwa_manager/ui/pending_order.dart';
import 'package:smart_ahwa_manager/widgets/dashboard_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: const Color(0xff93501F),
        foregroundColor: Colors.white,
      ),
      body: ValueListenableBuilder(
        valueListenable: OrderManager().orders,
        builder: (context, orders, _) {
          final pending = OrderManager().pendingOrders.length;
          final completed = OrderManager().completedOrders.length;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                DashboardCard(
                  title: "Pending Orders",
                  count: pending,
                  color: Colors.orange,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PendingOrder()),
                      ),
                ),
                DashboardCard(
                  title: "Completed Orders",
                  count: completed,
                  color: Colors.green,
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CompletedOrder(),
                        ),
                      ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff93501F),
        foregroundColor: Colors.white,
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddOrder()),
            ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
