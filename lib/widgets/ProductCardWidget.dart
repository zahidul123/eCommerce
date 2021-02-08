import 'dart:ffi';

import 'package:ciblecommerce/HomeScreen/Data/model/Product_List_Data_Model.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/UiView/ProductDetailsUi.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatefulWidget {
  ProductList productList;

  ProductCardWidget(this.productList);

  @override
  State<StatefulWidget> createState() {
    return ProductCardView(productList);
  }
}

class ProductCardView extends State<ProductCardWidget> {
  ProductList productList;

  ProductCardView(this.productList);

  bool showOverlay = true;

  @override
  Widget build(BuildContext context) {
    return showOverlay
        ? InkWell(
            child: Card(
              elevation: 5,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                          width: MediaQuery.of(context).size.width * .48,
                          height: MediaQuery.of(context).size.width * .28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/ic_icons/lather.jpg'),
                              ))),
                    ),
                    Expanded(
                      child: Padding(
                        child: FittedBox(
                          child: Text(
                            productList.categoryName,
                            style: TextStyle(fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                        padding: EdgeInsets.all(5),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            child: FittedBox(
                              child: Text(
                                "Price:\$ " + productList.sellingPrice,
                                style: TextStyle(fontStyle: FontStyle.italic,fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                              fit: BoxFit.scaleDown,
                            ),
                            padding: EdgeInsets.only(left: 5,bottom: 10 ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        InkWell(
                          child: Icon(Icons.more_vert_rounded),
                          onTap: () {
                            showOverlay = false;
                          },
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsUi(product_id: productList.productId)));
            },
          )
        :
    InkWell(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              child: Stack(
                children: [
                  Card(
                    color: CustomColors.jet_gray,
                    elevation: 5,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                                width: MediaQuery.of(context).size.width * .48,
                                height: MediaQuery.of(context).size.width * .28,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      colorFilter: ColorFilter.mode(Colors.black87, BlendMode.color),
                                      image: AssetImage(
                                          'assets/ic_icons/lather.jpg'),
                                    ))),
                          ),
                          Expanded(
                            child: Padding(
                              child: FittedBox(
                                child: Text(
                                  productList.categoryName,
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.center,
                                ),
                                fit: BoxFit.scaleDown,
                              ),
                              padding: EdgeInsets.all(5),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Padding(
                                  child: FittedBox(
                                    child: Text(
                                      "Price:\$ " + productList.sellingPrice,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                      textAlign: TextAlign.start,
                                    ),
                                    fit: BoxFit.scaleDown,
                                  ),
                                  padding: EdgeInsets.all(5),
                                ),
                              ),
                              InkWell(
                                child: Icon(Icons.more_horiz_outlined),
                                onTap: () {
                                  showOverlay = false;
                                },
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  Card(
                    color: Colors.transparent,
                    child:Container(
                      height: double.maxFinite,
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(height: 40,),
                         Padding(padding: EdgeInsets.symmetric(horizontal: 12),
                          child:  TweenAnimationBuilder(
                            duration: Duration(milliseconds: 700),
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (BuildContext context, double value, Widget child) {
                              return Opacity(
                                opacity: value,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5) ,
                                  child: Container(
                                    height: 30,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Add to cart"),
                                        SizedBox(width: 10,),
                                        Icon(Icons.add_shopping_cart)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),),
                          SizedBox(height:15,),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 12),
                            child:  TweenAnimationBuilder(
                              duration: Duration(milliseconds: 1400),
                              tween: Tween<double>(begin: 0, end: 1),
                              builder: (BuildContext context, double value, Widget child) {
                                return Opacity(
                                  opacity: value,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5) ,
                                    child: Container(
                                      height: 30,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Add to Wish"),
                                          SizedBox(width: 10,),
                                          Icon(Icons.add_shopping_cart)
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),),
                          SizedBox(height: 15,),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 12),
                            child:  TweenAnimationBuilder(
                              duration: Duration(milliseconds: 2000),
                              tween: Tween<double>(begin: 0, end: 1),
                              builder: (BuildContext context, double value, Widget child) {
                                return Opacity(
                                  opacity: value,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5) ,
                                    child: Container(
                                      height: 30,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Go to Details"),
                                          SizedBox(width: 10,),
                                          Icon(Icons.add_shopping_cart)
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),),
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
            onTap: () {
              showOverlay = true;
            },
          );
  }
}
