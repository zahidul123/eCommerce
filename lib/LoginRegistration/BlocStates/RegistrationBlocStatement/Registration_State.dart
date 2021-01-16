import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
abstract class RegistrationState extends Equatable{
}

class RegistrationInitialState extends RegistrationState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class RegistrationLoadingState extends RegistrationState{

  @override
  // TODO: implement props
  List<Object> get props => [];
}
class RegistrationLoadedState extends RegistrationState{
  String response;
  RegistrationLoadedState({@required this.response});
  @override
  // TODO: implement props
  List<Object> get props => [response];
}
class RegistrationErrorState extends RegistrationState{
  String errormessage;
  RegistrationErrorState({@required this.errormessage});
  @override
  // TODO: implement props
  List<Object> get props => [errormessage];
}