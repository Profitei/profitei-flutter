import 'package:equatable/equatable.dart';
import 'order_item.dart';

class OrderDetails extends Equatable {
  final String id;
  final List<OrderItem> orderItems;
  final num discount;

  const OrderDetails({
    required this.id,
    required this.orderItems,
    required this.discount,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
