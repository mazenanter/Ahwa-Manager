import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/services/order_manager.dart';
import 'package:smart_ahwa_manager/services/report_generator.dart';

class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    final orderManager = OrderManager();

    final totalOrders = orderManager.orders.value.length;
    final completed = orderManager.completedOrders.length;
    final pending = orderManager.pendingOrders.length;

    final topDrink = ReportGenerator().getTopSellingDrink(
      orderManager.orders.value,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff93501F),
        foregroundColor: Colors.white,
        title: Text('Reports'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildReportCard(
              title: 'Total Orders',
              value: "$totalOrders",
              color: Colors.blue,
            ),
            _buildReportCard(
              title: 'Completed Orders',
              value: "$completed",
              color: Colors.green,
            ),
            _buildReportCard(
              title: 'Pending Orders',
              value: "$pending",
              color: Colors.orange,
            ),
            FittedBox(
              child: _buildReportCard(
                title: 'Top Selling Drink',
                value: " ${topDrink.drinkName} (${topDrink.count})",
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard({
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
