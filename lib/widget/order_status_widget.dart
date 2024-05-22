import 'package:flutter/material.dart';
import 'package:flutter_application_lilyannsalon/widget/order_model.dart';

class OrderStatusWidget extends StatelessWidget {
  final Order order;

  OrderStatusWidget({ required this.order});

  @override
  Widget build(BuildContext context) {
    String statusText;
    Color statusColor;

    switch (order.status) {
      case OrderStatus.pending:
        statusText = "Pending";
        statusColor = Colors.orange;
        break;
      case OrderStatus.processing:
        statusText = "Processing";
        statusColor = Colors.blue;
        break;
      case OrderStatus.completed:
        statusText = "Completed";
        statusColor = Colors.green;
        break;
      case OrderStatus.cancelled:
        statusText = "Cancelled";
        statusColor = Colors.red;
        break;
    }

    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        statusText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
