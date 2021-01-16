import 'package:ciblecommerce/LoginRegistration/BlocStates/RegistrationBlocStatement/Registration_Event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/RegistrationBlocStatement/Registration_State.dart';
import 'package:ciblecommerce/LoginRegistration/Data/Registration_Repository.dart';
import 'package:flutter/cupertino.dart';

class RegistrationBloc extends Bloc<RegistrationEvent,RegistrationState>{
  RegistrationRepository registrationRepository;

  RegistrationBloc({@required this.registrationRepository}) : super(null);
  RegistrationState get initialstate=>RegistrationInitialState();

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async*{
    if(event is FetchRegistrationEvent){
      try{
        yield RegistrationLoadingState();
        String response=await registrationRepository.getRegistrationResponse(email: event.email, password: event.password);

        yield RegistrationLoadedState(response: response);
      }catch(e){
        print("exception "+e);
        yield RegistrationErrorState(errormessage: "Sorry to login");
      }
    }
  }

}