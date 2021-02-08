import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmOrderPage extends StatelessWidget {
  var items="1";
  var paymenttype,shippingAdd,billingAdd;
  String firstName,lastName,phone,email,address,city;
  String deleveryType;
  ConfirmOrderPage(this.firstName, this.lastName,this.phone, this.email, this.address, this.city,this.deleveryType );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            'Order Summary',
            style: TextStyle(color: Colors.black),
          )),
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 5,),
            Padding(padding: EdgeInsets.only(left: 10),
            child:Container(
              height: 30,
              child:Text("Receiver : $firstName $lastName",style: TextStyle(color: CustomColors.gunmetal_black,
                  fontSize:22,fontWeight: FontWeight.w600),) ,
            ) ,),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                  width: double.infinity,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Padding(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Total $items items",),
                      Text("MRP $items BDT"),
                    ],),padding: EdgeInsets.only(left: 5,top: 5),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    elevation: 5,
                  ),
                ),),
                Divider(thickness: 1,color: CustomColors.gunmetal_black,),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Payment Type"),
                          Text("$deleveryType"),
                        ],),
                        padding: EdgeInsets.only(left: 5,top: 5),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      elevation: 5,
                    ),
                  ),),
            ],),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5,top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Shopping Address"),
                          Text("$address"),
                        ],),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      elevation: 5,
                    ),
                  ),),
                Divider(thickness: 1,color: CustomColors.gunmetal_black,),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5,top: 5),
                        child: Padding(
                          padding: EdgeInsets.only(top: 5,left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Billing Address"),
                            Text(" $city"),
                          ],),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      elevation: 5,
                    ),
                  ),),
              ],),
            SizedBox(height: 2,),
            Container( height: 40,
              color: Colors.black12 ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10,),
                  Text("Your Ordered Items",style: TextStyle(fontSize: 20))
                ],
              ),),
            Container(
              height: MediaQuery.of(context).size.height*.5,
              child: ListView(children: [
                Card(
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

                                Container(
                                  width: 200,
                                  child:Padding(padding: EdgeInsets.all(1),
                                    child: Text("my product name",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: CustomColors.GreenDark,
                                          fontWeight: FontWeight.bold),),) ,) ,
                                SizedBox(height: 5,),
                                Text("MRP: 250 BDT"),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("MRP: 250 BDT",
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

                                          },
                                        ),
                                        SizedBox(width: 5,),
                                        Text("1",style: TextStyle(
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
                ),
                Card(
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

                                Container(
                                  width: 200,
                                  child:Padding(padding: EdgeInsets.all(1),
                                    child: Text("my product name",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: CustomColors.GreenDark,
                                          fontWeight: FontWeight.bold),),) ,) ,
                                SizedBox(height: 5,),
                                Text("MRP: 250 BDT"),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("MRP: 250 BDT",
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

                                          },
                                        ),
                                        SizedBox(width: 5,),
                                        Text("1",style: TextStyle(
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
                ),
                Card(
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

                                Container(
                                  width: 200,
                                  child:Padding(padding: EdgeInsets.all(1),
                                    child: Text("my product name",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: CustomColors.GreenDark,
                                          fontWeight: FontWeight.bold),),) ,) ,
                                SizedBox(height: 5,),
                                Text("MRP: 250 BDT"),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("MRP: 250 BDT",
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

                                          },
                                        ),
                                        SizedBox(width: 5,),
                                        Text("1",style: TextStyle(
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
                ),
                Card(
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

                                Container(
                                  width: 200,
                                  child:Padding(padding: EdgeInsets.all(1),
                                    child: Text("my product name",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: CustomColors.GreenDark,
                                          fontWeight: FontWeight.bold),),) ,) ,
                                SizedBox(height: 5,),
                                Text("MRP: 250 BDT"),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("MRP: 250 BDT",
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

                                          },
                                        ),
                                        SizedBox(width: 5,),
                                        Text("1",style: TextStyle(
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
                ),
                Card(
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

                                Container(
                                  width: 200,
                                  child:Padding(padding: EdgeInsets.all(1),
                                    child: Text("my product name",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: CustomColors.GreenDark,
                                          fontWeight: FontWeight.bold),),) ,) ,
                                SizedBox(height: 5,),
                                Text("MRP: 250 BDT"),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("MRP: 250 BDT",
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

                                          },
                                        ),
                                        SizedBox(width: 5,),
                                        Text("1",style: TextStyle(
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
                ),
                Card(
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

                                Container(
                                  width: 200,
                                  child:Padding(padding: EdgeInsets.all(1),
                                    child: Text("my product name",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: CustomColors.GreenDark,
                                          fontWeight: FontWeight.bold),),) ,) ,
                                SizedBox(height: 5,),
                                Text("MRP: 250 BDT"),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("MRP: 250 BDT",
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

                                          },
                                        ),
                                        SizedBox(width: 5,),
                                        Text("1",style: TextStyle(
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
                ),
              ],),
            ),
            Expanded(child: Align(alignment:Alignment.bottomLeft ,
              child: Container(
                  color: Colors.red,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20),
                    ),
                  )),))

          ],) ,
      ),
    );
  }

}