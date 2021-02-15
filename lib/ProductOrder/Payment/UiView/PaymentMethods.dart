import 'package:ciblecommerce/CartListAndOrder/CartListUi/OrderListModel.dart';
import 'package:ciblecommerce/ProductOrder/OrderSummery/ConfirmationOrderPage.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget{
  String firstName,lastName,phone,email,address,city,zip,country;
  double prices;
  List<OrderListModel> orderListArray;
  PaymentMethod(this.firstName, this.lastName,this.phone, this.email, this.address, this.city
      ,this.prices,this.zip,this.country,this.orderListArray );

  @override
  State<StatefulWidget> createState() {
   return PaymentMethodUi(this.firstName, this.lastName,this.phone, this.email, this.address, this.city
       ,this.prices,this.zip,this.country,this.orderListArray);
  }
}

class PaymentMethodUi extends State<PaymentMethod> {
  List imagelist=[
    "assets/ic_icons/paypal.png",
    "assets/ic_icons/bkash.png",
    "assets/ic_icons/bkash.png"
  ];
  String firstName,lastName,phone,email,address,city,zip,country;
  double prices;
  List<OrderListModel> orderListArray;
  PaymentMethodUi(this.firstName, this.lastName,this.phone, this.email, this.address, this.city
      ,this.prices,this.zip,this.country,this.orderListArray);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Payment Methods',
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left:size.width*.04,right:size.width*.04),
           child: AnimatedPositioned(
             duration: Duration(milliseconds: 300),
            left: MediaQuery.of(context).size.width/2,
             curve: Curves.fastLinearToSlowEaseIn,
             child: InkWell(
               onTap: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) =>
                             ConfirmOrderPage(this.firstName, this.lastName,this.phone,
                                 this.email, this.address, this.city,this.zip,this.country,"cashOn",this.prices,this.orderListArray)));
               },
               child: Container(
                 margin: EdgeInsets.only(top: size.height*.3),
                 height: 100,
                 decoration: BoxDecoration(
                   color: CustomColors.green,
                   borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(2),
                       topRight: Radius.circular(2),
                       bottomLeft: Radius.circular(2),
                       bottomRight: Radius.circular(2)
                   ),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.5),
                       spreadRadius: 5,
                       blurRadius: 7,
                       offset: Offset(0, 3), // changes position of shadow
                     ),
                   ],
                 ),
                 alignment: Alignment.center,
                 child:
                 Text("Cash on delivery",style: TextStyle(fontSize: 30,color: Colors.white),)
                 /*CarouselSlider(
                    items: imagelist.map((images) {
                      return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              height:
                              MediaQuery.of(context).size.height *
                                  0.30,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                color: Colors.blueAccent,
                                child: InkWell(onTap:(){
                                  final scaffold = Scaffold.of(context);
                                  scaffold.showSnackBar(
                                    SnackBar(
                                      content: const Text('Added to favorite'),
                                      action: SnackBarAction(
                                          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
                                    ),
                                  );
                                },
                                child: Image.network(
                                  images,
                                  fit: BoxFit.cover,
                                ),),
                              ),
                            );
                          });
                    }).toList(),
                    options: CarouselOptions(
                      height: 120,
                      aspectRatio: 16 / 3,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration:
                      Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    )
                )*/,

               ),
             ),
           ),),
          SizedBox(height: 20,),
          Padding(padding: EdgeInsets.only(left:size.width*.04,right:size.width*.04),

              child:InkWell(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          insetPadding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                          child: Container(

                            height: 300,
                            child: Column(
                              children: [
                                TweenAnimationBuilder(
                                  child:  Icon(Icons.warning_amber_rounded,size: 80,color: Colors.green,),
                                  tween: Tween<double>(begin: 0, end: 1),
                                  duration: Duration(seconds: 2),
                                  builder: (BuildContext context, double _val, Widget child) {
                                    return Opacity(
                                      opacity: _val,
                                      child: Padding(
                                          padding: EdgeInsets.only(top: _val * 20),
                                          child: child
                                      ),
                                    );
                                  },
                                ),
                                    Text("Please select any payment method?",style: TextStyle(fontSize: 20,),),
                                Container(
                                  width: 400,
                                  height: 150,
                                  child: Padding(padding: EdgeInsets.all(10),
                                    child: Card(
                                      color: CustomColors.silver_White,
                                      shadowColor: CustomColors.silver_White,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(color: CustomColors.gunmetal_black, width: 1),
                                          borderRadius: BorderRadius.circular(2)
                                      ),
                                      elevation: 2,
                                      child:Padding(padding: EdgeInsets.all(5),
                                       child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context,position){
                                          return InkWell(child: Container(
                                            height:MediaQuery.of(context).size.width*.5 ,
                                            width: MediaQuery.of(context).size.width*.5,
                                            child:Card(
                                              color: Colors.white,
                                              elevation: 2.0,
                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                              child: Image.asset(imagelist[position]),
                                            ) ,
                                          ),
                                          onTap: (){
                                            String deleveryType;
                                            if(position==0){
                                              deleveryType="paypal";
                                            }else if(position==1){
                                              deleveryType="bkash";
                                            }else{
                                              deleveryType="rocket";
                                            }
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ConfirmOrderPage(this.firstName, this.lastName,this.phone, this.email, this.address,
                                                            this.city,this.zip,this.country,deleveryType,this.prices,this.orderListArray)));
                                          },
                                          );
                                        },
                                        itemCount: imagelist.length,

                                      ),
                                      )
                                      ,),
                                  ),)
                              ],
                            ),
                          ),
                        );
                      });
                  /*AwesomeDialog(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width:800,
                    context: context,
                    dialogType: DialogType.QUESTION,
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'This is Ignored',
                    desc: 'This is also Ignored',
                    showCloseIcon: true,
                    body: Container(
                      height: 150,
                      child: Padding(padding: EdgeInsets.all(10),
                      child: Card(
                        shadowColor: CustomColors.silver_White,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: CustomColors.gunmetal_black, width: 1),
                          borderRadius: BorderRadius.circular(2)
                        ),
                        elevation: 2,
                        child:ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,position){
                            return Container(
                              height:MediaQuery.of(context).size.width*.5 ,
                              width: MediaQuery.of(context).size.width*.5,
                              child:Card(

                                color: Colors.white,
                                elevation: 2.0,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset(imagelist[position]),
                              ) ,
                            );
                          },
                          itemCount: imagelist.length,
                        ),),
                      ),),

                  )..show();*/

                },
                child:Expanded(
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: CustomColors.dark_shalet_blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2),
                            bottomLeft: Radius.circular(2),
                            bottomRight: Radius.circular(2)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child:
                      Text("Cash on others",style: TextStyle(fontSize: 30,color: Colors.white),)


                  ),
                ) ,
              ) ,
            )
        ],
      ),

    );
  }

}