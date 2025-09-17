import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/models/drink.dart';
import 'package:smart_ahwa_manager/models/hibiscus_tea.dart';
import 'package:smart_ahwa_manager/models/order.dart';
import 'package:smart_ahwa_manager/models/shai.dart';
import 'package:smart_ahwa_manager/models/turkish_coffe.dart';
import 'package:smart_ahwa_manager/services/order_manager.dart';
import 'package:smart_ahwa_manager/widgets/app_button.dart';
import 'package:smart_ahwa_manager/widgets/build_text_form_feild.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  final customerNameController = TextEditingController();
  final specialInstructionsController = TextEditingController();
  String? selectedDrink = 'Shai';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Order"),
        backgroundColor: const Color(0xff93501F),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BuildTextFormFeild(
              label: 'Customer Name',
              controller: customerNameController,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedDrink,
              decoration: InputDecoration(
                labelText: 'Select Drink',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff93501F)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'Shai', child: Text('Shai')),
                DropdownMenuItem(
                  value: 'Turkish Coffee',
                  child: Text('Turkish Coffee'),
                ),
                DropdownMenuItem(
                  value: 'Hibiscus Tea',
                  child: Text('Hibiscus Tea'),
                ),
              ],
              onChanged: (value) => setState(() => selectedDrink = value),
            ),
            const SizedBox(height: 12),
            BuildTextFormFeild(
              label: 'Special Instructions',
              controller: specialInstructionsController,
            ),
            const SizedBox(height: 20),
            AppButton(text: "Add Order", onPressed: _addOrder),
          ],
        ),
      ),
    );
  }

  void _addOrder() {
    Drink drink;
    switch (selectedDrink) {
      case 'Shai':
        drink = Shai();
        break;
      case 'Turkish Coffee':
        drink = TurkishCoffe();
        break;
      case 'Hibiscus Tea':
        drink = HibiscusTea();
        break;
      default:
        throw Exception("Invalid drink");
    }

    OrderManager().addOrder(
      Order(
        orderId: DateTime.now().millisecondsSinceEpoch.toString(),
        customerName: customerNameController.text,
        drink: drink,
        specialInstructions: specialInstructionsController.text,
      ),
    );

    Navigator.pop(context);
  }
}
