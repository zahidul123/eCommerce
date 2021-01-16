import 'package:ciblecommerce/DashBoard/DashBoardUiView/BlocStates/DashBoard_Event.dart';
import 'package:ciblecommerce/DashBoard/DashBoardUiView/BlocStates/DashBoard_States.dart';
import 'package:ciblecommerce/DashBoard/DashBoardUiView/Data/DashBoard_DataRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardBloc extends Bloc<DashBoardEvent,DashBoardState>{
  DashBoardDataRepository dashBoardDataRepository;

  DashBoardBloc({@required this.dashBoardDataRepository}) : super(null);
  DashBoardState get dashboardstate=>DashBoardStateInitialState();
  @override
  Stream<DashBoardState> mapEventToState(DashBoardEvent event) async* {
    if(event is FetchDashBoardEvent){
      try{
        yield DashBoardStateLoadingState();
        var response=dashBoardDataRepository.getDashBoardDataRepository(user_id: event.user_id);
        yield DashBoardStateLoadedState(response: response);
      }catch(e){
        yield DashBoardStateErrorState(errormessage: "No data found");
      }
    }
  }

}