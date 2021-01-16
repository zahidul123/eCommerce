class CartModel {
  String product_id;
  String product_title;
  String product_description;
  String product_price;
  String product_quantity;
  String product_image;
  String product_list_type;

  CartModel(
      this.product_id,
      this.product_title,
      this.product_description,
      this.product_price,
      this.product_quantity,
      this.product_image,
      this.product_list_type);

  Map<String, dynamic> MaketoMap() {
    var map = Map<String, dynamic>();
    if (product_id != null) {
      map["product_id"] = product_id;
    }
    map["product_title"] = product_title;
    map["product_description"] = product_description;
    map["product_price"] = product_price;
    map["product_quantity"] = product_quantity;
    map["product_image"] = product_image;
    map["product_list_type"] = product_list_type;
    return map;
  }

  // Extract a Note object from a Map object
  CartModel.fromMapObject(Map<String, dynamic> map) {
    this.product_id = map["product_id"];
    this.product_title = map["product_title"];
    this.product_description = map["product_description"];
    this.product_price = map["product_price"];
    this.product_quantity = map["product_quantity"];
    this.product_image = map["product_image"];
    this.product_list_type = map["product_list_type"];
  }
}
