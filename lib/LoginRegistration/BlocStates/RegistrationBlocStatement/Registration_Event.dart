import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
abstract class RegistrationEvent extends Equatable{

}

class FetchRegistrationEvent extends RegistrationEvent{
  String email,password;
  FetchRegistrationEvent({@required this.email,@required this.password});
  @override
  // TODO: implement props
  List<Object> get props =>[email,password];

}
class InitialEvent extends RegistrationEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];

}


