import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
abstract class CategoryListEvent extends Equatable{}

class FetchCategoryListEvent extends CategoryListEvent{
  String categoryId;
  FetchCategoryListEvent({@required this.categoryId});
  @override
  // TODO: implement props
  List<Object> get props => [categoryId];

}