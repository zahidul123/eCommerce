import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
abstract class LoginState extends Equatable{
}

class LoginInitialState extends LoginState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class RefressState extends LoginState{
  @override
  // TODO: implement props
  List<Object> get props => ["nothing"];

}
class LoginLoadingState extends LoginState{

  @override
  // TODO: implement props
  List<Object> get props => [];
}
class LoginLoadedState extends LoginState{
  String response;
  LoginLoadedState({@required this.response});
  @override
  // TODO: implement props
  List<Object> get props => [response];
}
class LoginErrorState extends LoginState{
  String errormessage;
  LoginErrorState({@required this.errormessage});
  @override
  // TODO: implement props
  List<Object> get props => [errormessage];
}