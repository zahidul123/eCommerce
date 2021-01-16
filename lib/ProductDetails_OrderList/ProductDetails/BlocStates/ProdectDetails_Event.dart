import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductDetailsEvent extends Equatable{
}

class FetchProductDetailsEvent extends ProductDetailsEvent{
  String product_id;
  /*String companny_id;*/

  FetchProductDetailsEvent({@required this.product_id/*,@required this.companny_id*/});

  @override
  // TODO: implement props
  List<Object> get props => [product_id];

}