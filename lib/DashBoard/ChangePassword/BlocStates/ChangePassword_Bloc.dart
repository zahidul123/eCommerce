import 'package:ciblecommerce/DashBoard/ChangePassword/BlocStates/ChangePassword_Event.dart';
import 'package:ciblecommerce/DashBoard/ChangePassword/BlocStates/ChangePassword_State.dart';
import 'package:ciblecommerce/DashBoard/ChangePassword/Data/ChangePassword_Repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ChangePasswordBloc extends Bloc<ChangePasswordEvent,ChangePasswordState>{
  ChangePassword_Repository changePassword_Repository;
  ChangePasswordBloc({@required this.changePassword_Repository}) : super(null);
   ChangePasswordState get changePasswordInitialState=>ChangePasswordInitialState();
  @override
  Stream<ChangePasswordState> mapEventToState(ChangePasswordEvent event)async* {
    if(event is FetchChangePasswordEvent){
      try{
        yield ChangePasswordLoadingState();
        var response=await changePassword_Repository.getChangePasswordResponse(user_id: event.user_id, old_password: event.oldpassword, new_password: event.newpassword, confirm_password: event.confirmpassword);
        yield ChangePasswordLoadedState(response: response);
      }catch (e){
        yield ChangePasswordErrorState(errormessage: "sorry to change password");
      }
    }
  }

}