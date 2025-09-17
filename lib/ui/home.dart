import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/ui/dashboard.dart';
import 'package:smart_ahwa_manager/ui/reports.dart';
import 'package:smart_ahwa_manager/utils/app_colors.dart';
import 'package:smart_ahwa_manager/widgets/order_stat_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          'Smart Ahwa App',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          spacing: 16,
          children: [
            Expanded(
              child: OrderStatCard(
                title: "Dashboard",
                value: "▶",
                color: AppColors.primary,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Dashboard()),
                    ),
              ),
            ),
            Expanded(
              child: OrderStatCard(
                title: "Reports",
                value: "📊",
                color: AppColors.primary,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Reports()),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
