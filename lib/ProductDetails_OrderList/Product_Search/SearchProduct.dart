import 'package:ciblecommerce/HomeScreen/Data/model/Category_Data_Model.dart';
import 'package:ciblecommerce/HomeScreen/Data/model/Product_List_Data_Model.dart';
import 'package:ciblecommerce/HomeScreen/UiView/HomeScreen.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchProduct extends StatefulWidget {
  List<CatList> categoryList=List<CatList>();
  List<ProductList> productList=List<ProductList>();
  SearchProduct(this.categoryList,this.productList);

  @override
  State<StatefulWidget> createState() {
    return SearchProductUi(categoryList,productList);
  }
}

class SearchProductUi extends State<SearchProduct> {
  TextEditingController searchcontroll = TextEditingController();
  List<CatList>categorylist=List<CatList>();
  List<CatList>categorylistTemp=List<CatList>();
  List<ProductList> productList=List<ProductList>();
  List<ProductList> productListTemp=List<ProductList>();
  bool catproductlistview;
  bool containershow=true;

  SearchProductUi(this.categorylist,this.productList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_back,
                          ),
                          onTap: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Home())),
                        )),
                  ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10,left: 5,right: 5),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xffEFEFEF),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  onChanged: searchProduct,
                                  style: TextStyle(color: CustomColors.optimal_black),
                                  controller: searchcontroll,
                                  decoration: InputDecoration(
                                      hintText: "Search",
                                      prefixIcon:
                                      Icon(Icons.search, color: CustomColors.optimal_black),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ],),
                SizedBox(height: 10,),
                Container(
                  height: MediaQuery.of(context).size.height*.8,
                  child:containershow?Container(
                  ):catproductlistview?makeCategoryList(categorylistTemp):makeProductList(productListTemp),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void searchProduct(String value) {
    categorylistTemp.clear();
    productListTemp.clear();
    if(value!=""){
      categorylist.forEach((element) {
        if(element.categoryName.toLowerCase().contains(value.toLowerCase())){
          setState(() {
            categorylistTemp.add(element);
          });
        }
      });
      productList.forEach((element) {
        if(element.productName.toLowerCase().contains(value.toLowerCase())){
          setState(() {
            productListTemp.add(element);
          });
        }
      });
      if(categorylistTemp.length>0){
        setState(() {
          containershow=false;
          catproductlistview=true;
        });
      }
      if(productListTemp.length>0){
        setState(() {
          containershow=false;
          catproductlistview=false;
        });
      }
      if(categorylistTemp.length>productListTemp.length){
        setState(() {
          containershow=false;
          catproductlistview=true;
        });
      }

    }else{
      setState(() {
        containershow=true;
      });
    }


  }

  makeCategoryList(List<CatList> categorylistTemp) {
    return ListView.builder(
      itemCount: categorylistTemp.length,
        itemBuilder:(context,position){
        return InkWell(
          child:Card(
            elevation: 5,
            child:Container(
              height: 100,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Padding(padding: EdgeInsets.all(5),
                      child: Container(
                          width: MediaQuery.of(context).size.width * .51,
                          height: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/ic_icons/lather.jpg'),
                              ))),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(categorylistTemp[position].categoryName),
                        ),
                        Expanded(
                          child: Text(categorylistTemp[position].created),
                        ),
                        Expanded(
                          child: Text(categorylistTemp[position].categoryCode!=""?categorylistTemp[position].categoryCode:"123"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
        });

  }


  makeProductList(List<ProductList> productListTemp) {
    return ListView.builder(
        itemCount: productListTemp.length,
        itemBuilder:(context,position){
          return InkWell(
            child:Card(
              elevation: 5,
              child:Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Padding(padding: EdgeInsets.all(5),
                        child: Container(
                            width: MediaQuery.of(context).size.width * .48,
                            height: MediaQuery.of(context).size.width * .3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/ic_icons/lather.jpg'),
                                ))),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Text(productListTemp[position].categoryName),
                          ),
                          Expanded(
                            child: Text(productListTemp[position].costPrice),
                          ),
                          Expanded(
                            child: Text(productListTemp[position].authorName),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
