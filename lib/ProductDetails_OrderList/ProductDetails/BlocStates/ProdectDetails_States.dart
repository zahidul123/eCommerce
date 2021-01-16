import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductDetails_State extends Equatable{}

class ProductDetailsInitialState extends ProductDetails_State{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class ProductDetailsLOadingState extends ProductDetails_State{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class ProductDetailsLoadedState extends ProductDetails_State{
  var response;

  ProductDetailsLoadedState({@required this.response});

  @override
  List<Object> get props => [response];
}
class ProductDetailsErrorState extends ProductDetails_State{
  String errormessage;

  ProductDetailsErrorState({@required this.errormessage});

  @override
  List<Object> get props => [errormessage];
}