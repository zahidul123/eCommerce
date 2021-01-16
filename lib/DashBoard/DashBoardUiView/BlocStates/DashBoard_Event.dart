import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
abstract class DashBoardEvent extends Equatable{
}

class FetchDashBoardEvent extends DashBoardEvent{
  String user_id;
  FetchDashBoardEvent({@required this.user_id});
  @override
  // TODO: implement props
  List<Object> get props => [user_id];

}