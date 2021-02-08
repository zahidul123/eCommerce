
import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/Data/modelClass/CategoryResponseModel.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/Data/repository/DataRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/BlocStates/CategoryListEvent.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/BlocStates/CategoryListState.dart';

class CategoryListBloc extends Bloc<CategoryListEvent,CategoryListState>{
  CategoryDataListRepository categoryDataListRepository;
  CategoryListBloc({@required this.categoryDataListRepository}) : super(null);
  CategoryListState get categoryListInitial=>CategoryListInitialState();
  @override
  Stream<CategoryListState> mapEventToState(CategoryListEvent event) async*{

    if(event is FetchCategoryListEvent){
      try{
        yield CategoryListLoadingState();
        List<BookList> categoryData;
        categoryData= await categoryDataListRepository.getCategoryListResponse(caregoryId: event.categoryId);
        yield CategoryListDataLoadState(response: categoryData);
      }catch(e){
        yield CategoryListErrorState(errorResponse: e.toString());
      }

    }
  }

}