
class OrderListModel{
  //String product_id;
  String book_id;
  //String product_quantity;
  String selling_price;
  OrderListModel(this.book_id,this.selling_price);
  Map<String, dynamic> toJsonAttr() => {
    'book_id': book_id,
    'selling_price': selling_price,
  };
}