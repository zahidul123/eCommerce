import 'package:bloc/bloc.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/LoginBlocState/Login_Event.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/LoginBlocState/Login_state.dart';
import 'package:ciblecommerce/LoginRegistration/Data/Login_Repository.dart';
import 'package:flutter/cupertino.dart';
class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginRepository loginRepository;

  LoginBloc({@required this.loginRepository}) : super(null);
  LoginState get initialstate=>LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async*{
    if(event is FetchLoginEvent){
      try{
        yield LoginLoadingState();
        String response=await loginRepository.getLoginResponse(email: event.email, password: event.password);
        yield LoginLoadedState(response: response);
      }catch(e){
        yield LoginErrorState(errormessage: "Sorry to login");
      }
    }else{
      yield RefressState();
    }
  }

}