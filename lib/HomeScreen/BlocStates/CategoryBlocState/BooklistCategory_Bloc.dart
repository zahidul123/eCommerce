import 'package:bloc/bloc.dart';
import 'package:ciblecommerce/HomeScreen/BlocStates/CategoryBlocState/BooklistCategory_Event.dart';
import 'package:ciblecommerce/HomeScreen/BlocStates/CategoryBlocState/BooklistCategory_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ciblecommerce/HomeScreen/Data/model/Category_Data_Model.dart';
import 'package:ciblecommerce/HomeScreen/Data/repository/Categories_Item.dart';
import 'package:meta/meta.dart';

class BooklistCategoryBloc extends Bloc<BooklistCategoryEvent,BooklistCategoryState>{
  CategoryRepository categoryRepository;
  BooklistCategoryBloc({@required this.categoryRepository}) : super(null);

  BooklistCategoryState get initialstate=>BooklistCategoryInitialState();

  @override
  Stream<BooklistCategoryState> mapEventToState(BooklistCategoryEvent event) async*{
    if(event is FetchBooklistCategoryEvent){
      yield BooklistCategoryLoadingState();
      try{
        List <CatList> booklist=await categoryRepository.getCategoryBook();
        print(booklist.length);
        yield BooklistCategoryLoadedState(booklist:booklist);
      }catch(e){
        yield BooklistCategoryErrorState(errormessage:e.toString());
        print("the error is bloc c "+e.toString());
      }
    }
  }

}