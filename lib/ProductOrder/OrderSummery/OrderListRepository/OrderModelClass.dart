import 'package:ciblecommerce/CartListAndOrder/CartListUi/OrderListModel.dart';

class OrderModel {
  String customer_id,
      billing_firstName,
      billing_lastName,
      billing_phone,
      billing_email,
      billing_city,
      billing_country,
      billing_zip,
      shipping_firstName,
      shipping_lastName,
      shipping_phone,
      shipping_email,
      shipping_city,
      shipping_country,
      shipping_address;
  List<OrderListModel> items;

  OrderModel(
      this.customer_id,
      this.billing_firstName,
      this.billing_lastName,
      this.billing_phone,
      this.billing_email,
      this.billing_city,
      this.billing_country,
      this.billing_zip,
      this.shipping_firstName,
      this.shipping_lastName,
      this.shipping_phone,
      this.shipping_email,
      this.shipping_city,
      this.shipping_country,
      this.shipping_address,
      this.items);
}
