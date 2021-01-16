import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
abstract class ChangePasswordState extends Equatable{
}
class ChangePasswordInitialState extends ChangePasswordState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class ChangePasswordLoadingState extends ChangePasswordState{

  @override
  // TODO: implement props
  List<Object> get props => [];

}
class ChangePasswordLoadedState extends ChangePasswordState{
  var response;
  ChangePasswordLoadedState({@required this.response});
  @override
  // TODO: implement props
  List<Object> get props => [response];

}
class ChangePasswordErrorState extends ChangePasswordState{
  String errormessage;
  ChangePasswordErrorState({@required this.errormessage});
  @override
  // TODO: implement props
  List<Object> get props => [errormessage];

}
class RefressState extends ChangePasswordState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}