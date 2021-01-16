import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
abstract class ChangePasswordEvent extends Equatable{

}
class FetchChangePasswordEvent extends ChangePasswordEvent{
   String user_id,oldpassword,newpassword,confirmpassword;

   FetchChangePasswordEvent({@required this.user_id,@required this.oldpassword,@required this.newpassword,@required this.confirmpassword});

  @override
  // TODO: implement props
  List<Object> get props => [user_id,oldpassword,newpassword,confirmpassword];
}

class InitialEvent extends ChangePasswordEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];

}