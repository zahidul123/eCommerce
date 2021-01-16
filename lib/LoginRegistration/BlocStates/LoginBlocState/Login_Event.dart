import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
abstract class LoginEvent extends Equatable{

}

class FetchLoginEvent extends LoginEvent{
  String email,password;
  FetchLoginEvent({@required this.email,@required this.password});
  @override
  // TODO: implement props
  List<Object> get props =>[email,password];

}

class InitialEvent extends LoginEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
