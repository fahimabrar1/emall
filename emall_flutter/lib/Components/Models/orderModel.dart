class orderModel {
  String product_id;
  String shop_id;
  String total;
  String order_address;
  String state;
  String user_email;

  orderModel({
    required this.product_id,
    required this.shop_id,
    required this.total,
    required this.order_address,
    required this.state,
    required this.user_email,
  });

  Map toJson() => {
        'product_id': product_id,
        'shop_id': shop_id,
        'total': total,
        'state': state,
        'user_email': user_email,
        'order_address': order_address,
      };
}
