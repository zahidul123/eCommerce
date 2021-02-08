
class OrderListModelClass {
  String total;

  List<MyList> list;
  bool success;

  OrderListModelClass({this.total, this.list, this.success});

  OrderListModelClass.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['list'] != null) {
      list = new List<MyList>();
      json['list'].forEach((v) {
        list.add(new MyList.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class MyList {
  String orderId;
  String status;
  String orderType;
  String customerId;
  String orderTotal;
  String billingFirstName;
  String billingLastName;
  String billingPhone;
  String billingEmail;
  String billingCity;
  String billingCountry;
  String billingZip;
  String billingAddress;
  String shippingFirstName;
  String shippingLastName;
  String shippingPhone;
  String shippingCity;
  String shippingCountry;
  String shippingEmail;
  String shippingZip;
  String shippingAddress;
  String remarks;
  String created;
  String updated;
  String invoiceDate;
  String number;
  String totalItem;
  Null paymentType;
  Null paymentDate;

  MyList(
      {this.orderId,
        this.status,
        this.orderType,
        this.customerId,
        this.orderTotal,
        this.billingFirstName,
        this.billingLastName,
        this.billingPhone,
        this.billingEmail,
        this.billingCity,
        this.billingCountry,
        this.billingZip,
        this.billingAddress,
        this.shippingFirstName,
        this.shippingLastName,
        this.shippingPhone,
        this.shippingCity,
        this.shippingCountry,
        this.shippingEmail,
        this.shippingZip,
        this.shippingAddress,
        this.remarks,
        this.created,
        this.updated,
        this.invoiceDate,
        this.number,
        this.totalItem,
        this.paymentType,
        this.paymentDate});

  MyList.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    status = json['status'];
    orderType = json['order_type'];
    customerId = json['customer_id'];
    orderTotal = json['order_total'];
    billingFirstName = json['billing_firstName'];
    billingLastName = json['billing_lastName'];
    billingPhone = json['billing_phone'];
    billingEmail = json['billing_email'];
    billingCity = json['billing_city'];
    billingCountry = json['billing_country'];
    billingZip = json['billing_zip'];
    billingAddress = json['billing_address'];
    shippingFirstName = json['shipping_firstName'];
    shippingLastName = json['shipping_lastName'];
    shippingPhone = json['shipping_phone'];
    shippingCity = json['shipping_city'];
    shippingCountry = json['shipping_country'];
    shippingEmail = json['shipping_email'];
    shippingZip = json['shipping_zip'];
    shippingAddress = json['shipping_address'];
    remarks = json['remarks'];
    created = json['created'];
    updated = json['updated'];
    invoiceDate = json['invoice_date'];
    number = json['number'];
    totalItem = json['totalItem'];
    paymentType = json['payment_type'];
    paymentDate = json['payment_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['status'] = this.status;
    data['order_type'] = this.orderType;
    data['customer_id'] = this.customerId;
    data['order_total'] = this.orderTotal;
    data['billing_firstName'] = this.billingFirstName;
    data['billing_lastName'] = this.billingLastName;
    data['billing_phone'] = this.billingPhone;
    data['billing_email'] = this.billingEmail;
    data['billing_city'] = this.billingCity;
    data['billing_country'] = this.billingCountry;
    data['billing_zip'] = this.billingZip;
    data['billing_address'] = this.billingAddress;
    data['shipping_firstName'] = this.shippingFirstName;
    data['shipping_lastName'] = this.shippingLastName;
    data['shipping_phone'] = this.shippingPhone;
    data['shipping_city'] = this.shippingCity;
    data['shipping_country'] = this.shippingCountry;
    data['shipping_email'] = this.shippingEmail;
    data['shipping_zip'] = this.shippingZip;
    data['shipping_address'] = this.shippingAddress;
    data['remarks'] = this.remarks;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['invoice_date'] = this.invoiceDate;
    data['number'] = this.number;
    data['totalItem'] = this.totalItem;
    data['payment_type'] = this.paymentType;
    data['payment_date'] = this.paymentDate;
    return data;
  }
}