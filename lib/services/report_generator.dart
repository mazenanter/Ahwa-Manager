import 'package:smart_ahwa_manager/models/order.dart';

class ReportGenerator {
  DrinkReport getTopSellingDrink(List<Order> orders) {
    if (orders.isEmpty) {
      throw Exception("No orders available");
    }

    Map<String, int> drinkCount = {};

    for (var order in orders) {
      String drinkName = order.drink.name;
      drinkCount[drinkName] = (drinkCount[drinkName] ?? 0) + 1;
    }

    var topEntry = drinkCount.entries.reduce(
      (a, b) => a.value > b.value ? a : b,
    );

    return DrinkReport(topEntry.key, topEntry.value);
  }
}

class DrinkReport {
  final String drinkName;
  final int count;

  DrinkReport(this.drinkName, this.count);
}
