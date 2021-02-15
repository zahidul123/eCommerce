
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatefulWidget{
  static CartItem of(BuildContext context) => context.findAncestorStateOfType<CartItem>();

  String product_title;
  String product_price;
  CartItemWidget(this.product_title,this.product_price);

  @override
  State<StatefulWidget> createState() {
    return CartItem(this.product_title,this.product_price);
  }


}

class CartItem extends State<CartItemWidget>{
  int count=1;
  double rate=0.0;
  String totalprice;
  String product_title;
  String product_price;
  CartItem(this.product_title,this.product_price);
  @override
  void initState() {
    // TODO: implement initState
    totalprice=product_price;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    rate=double.parse(product_price);
    return Card(
      color: Colors.white,
      child:Expanded(
        child: Container(
          height: MediaQuery.of(context).size.width * .3,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(1),
                child: Container(
                    width: MediaQuery.of(context).size.width * .3,
                    height: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/ic_icons/lather.jpg'),
                        ))),
              ),
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10,),
                   /* Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: MediaQuery.of(context).size.width*.6,),
                        Padding(padding: EdgeInsets.only(top: 3),
                          child: Icon(Icons.delete),)
                      ],),*/
                    Container(
                      width: 200,
                      child:Padding(padding: EdgeInsets.all(1),
                       child: Text(product_title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            color: CustomColors.GreenDark,
                            fontWeight: FontWeight.bold),),) ,) ,
                    SizedBox(height: 5,),
                    Text("MRP: $product_price BDT"),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("MRP: $totalprice BDT",
                          style: TextStyle(
                              color: CustomColors.GreenDark
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*.21,),
                        Row(
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,),
                                child:Text("-",textAlign: TextAlign.center,style: TextStyle(
                                    fontSize: 20,
                                    color: CustomColors.TextGrey,
                                    fontWeight: FontWeight.bold)),
                              ),
                              onTap: (){
                                if(count >1){
                                  setState(() {
                                    count--;
                                    totalprice=(count*rate).toString();
                                  });
                                }
                              },
                            ),
                            SizedBox(width: 5,),
                            Text("$count",style: TextStyle(
                                fontSize: 20,
                                color: CustomColors.TextGrey,
                                fontWeight: FontWeight.bold)),
                            SizedBox(width: 5,),
                            InkWell(
                              child: Container(
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,),
                                child:Text("+",textAlign: TextAlign.center,style: TextStyle(
                                    fontSize: 20,
                                    color: CustomColors.TextGrey,
                                    fontWeight: FontWeight.bold)),
                              ),
                              onTap:() {
                                if(count >0){
                                  setState(() {
                                    count++;
                                    totalprice=(count*rate).toString();
                                  });
                                }
                              },
                            )

                          ],)
                      ],
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}