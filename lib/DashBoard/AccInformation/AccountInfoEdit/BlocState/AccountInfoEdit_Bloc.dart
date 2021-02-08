import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoEdit/BlocState/AccountInfoEdit_Event.dart';
import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoEdit/BlocState/AccountInfoEdit_States.dart';
import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoEdit/Data/AccountInfoEditRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountInfoEdit_Bloc
    extends Bloc<AccountInfoEditEvent, AccountInfoEditState> {
  AccountInfoEditRepository accountInfoEditRepository;

  AccountInfoEdit_Bloc({@required this.accountInfoEditRepository}) : super(null);

  AccountInfoEditState get initialState => AccountInfoEditInitialState();

  @override
  Stream<AccountInfoEditState> mapEventToState(
      AccountInfoEditEvent event) async* {
    var response;
    if (event is FetchAccountInfoEditEvent) {
      yield AccountInfoEditLoadingState();
       response=await accountInfoEditRepository
          .getAccountInfoEditRepositoryResponse(user_id: event.user_id,
          first_name: event.first_name,
          last_name: event.last_name,
          phone: event.email,
          gender: event.gender,
          picture: event.picture,
          address: event.address,
          city: event.city,
          zip: event.zip,
          email: event.email,
          country: event.country);
      yield AccountInfoEditLoadedState(response: response);
    }else{
      yield AccountInfoEditErrorState(errormessage: response);
    }
  }


}