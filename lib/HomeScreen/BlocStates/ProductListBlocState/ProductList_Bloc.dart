import 'package:ciblecommerce/HomeScreen/Data/model/Product_List_Data_Model.dart';
import 'package:ciblecommerce/HomeScreen/Data/repository/Product_List_Repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:ciblecommerce/HomeScreen/BlocStates/ProductListBlocState/ProductList_Event.dart';
import 'package:ciblecommerce/HomeScreen/BlocStates/ProductListBlocState/ProductList_State.dart';

class ProductListBloc extends Bloc<ProductListShowEvent,ProductListState>{

  ProductListRepository productListRepository;

  ProductListBloc({@ required this.productListRepository}) : super(null);
  ProductListState get initialState=>ProductListInitialState();

  @override
  Stream<ProductListState> mapEventToState(ProductListShowEvent event) async*{

      if(event is FetchProductListEvent){
        try{
          yield ProductListLoadingState();
          List<ProductList> productlist=await productListRepository.getProductList();
          yield ProductListLoadedState(productList: productlist);
        }catch(e){
          yield ProductListErrorState(message: e.toString());
        }

      }

  }

}