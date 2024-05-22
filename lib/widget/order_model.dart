enum OrderStatus { pending, processing, completed, cancelled }

class Order {
  String orderId;
  String productName;
  int quantity;
  OrderStatus status;

  Order({
    required this.orderId,
    required this.productName,
    required this.quantity,
    required this.status,
  });
}
