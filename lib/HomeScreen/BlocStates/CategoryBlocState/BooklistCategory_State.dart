import 'package:ciblecommerce/HomeScreen/Data/model/Category_Data_Model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class BooklistCategoryState extends Equatable{}

class BooklistCategoryInitialState extends BooklistCategoryState{
  @override
  // TODO: implement props
  List<Object> get props =>[];
}
 class BooklistCategoryLoadingState extends BooklistCategoryState{
  @override
  // TODO: implement props
  List<Object> get props => [];

 }
 class BooklistCategoryLoadedState extends BooklistCategoryState{
  List<CatList> booklist;
  BooklistCategoryLoadedState({@required this.booklist});

  @override
  // TODO: implement props
  List<Object> get props => [booklist];

 }
 class BooklistCategoryErrorState extends BooklistCategoryState{
  String errormessage;
  BooklistCategoryErrorState({@required this.errormessage});

  @override
  // TODO: implement props
  List<Object> get props =>[errormessage];

 }
