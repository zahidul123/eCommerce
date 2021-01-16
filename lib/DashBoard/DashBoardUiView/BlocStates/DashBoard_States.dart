import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class DashBoardState extends Equatable{
}
class DashBoardStateInitialState extends DashBoardState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class DashBoardStateLoadingState extends DashBoardState{

  @override
  // TODO: implement props
  List<Object> get props => [];

}
class DashBoardStateLoadedState extends DashBoardState{
  var response;
  DashBoardStateLoadedState({@required this.response});
  @override
  // TODO: implement props
  List<Object> get props => [response];

}
class DashBoardStateErrorState extends DashBoardState{
  String errormessage;
  DashBoardStateErrorState({@required this.errormessage});
  @override
  // TODO: implement props
  List<Object> get props => [errormessage];

}