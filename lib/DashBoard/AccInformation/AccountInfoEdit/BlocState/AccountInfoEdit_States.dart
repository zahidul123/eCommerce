import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AccountInfoEditState extends Equatable{
}
class AccountInfoEditInitialState extends AccountInfoEditState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class AccountInfoEditLoadingState extends AccountInfoEditState{

  @override
  // TODO: implement props
  List<Object> get props => [];

}
class AccountInfoEditLoadedState extends AccountInfoEditState{
  var response;
  AccountInfoEditLoadedState({@required this.response});
  @override
  // TODO: implement props
  List<Object> get props => [response];

}
class AccountInfoEditErrorState extends AccountInfoEditState{
  String errormessage;
  AccountInfoEditErrorState({@required this.errormessage});
  @override
  // TODO: implement props
  List<Object> get props => [errormessage];

}