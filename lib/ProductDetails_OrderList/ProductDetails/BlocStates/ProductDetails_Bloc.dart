import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/BlocStates/ProdectDetails_Event.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/BlocStates/ProdectDetails_States.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/Datas/ProductDetailsRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent,ProductDetails_State>{
  ProductDetailsRepository productDetailsRepository;

  ProductDetailsBloc({@required this.productDetailsRepository}) : super(null);
  ProductDetails_State get initialState=>ProductDetailsInitialState();

  @override
  Stream<ProductDetails_State> mapEventToState(ProductDetailsEvent event) async* {
   if(event is FetchProductDetailsEvent){
     yield ProductDetailsLOadingState();
     var response=await productDetailsRepository.getProductDetailsrepository(Product_id: event.product_id/*, company_id: event.companny_id*/);
     yield ProductDetailsLoadedState(response: response);
   }
  }


}