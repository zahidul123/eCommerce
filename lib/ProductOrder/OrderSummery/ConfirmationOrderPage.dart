
import 'package:ciblecommerce/CartListAndOrder/AddToCart/Cartmodel.dart';
import 'package:ciblecommerce/CartListAndOrder/AddToCart/DatabaseHelperclass.dart';
import 'package:ciblecommerce/CartListAndOrder/CartListUi/OrderListModel.dart';
import 'package:ciblecommerce/ProductOrder/OrderSummery/CreateOrderBloc/CreateOrderBloc.dart';
import 'package:ciblecommerce/ProductOrder/OrderSummery/OrderListRepository/CreateOrderRepository.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmOrderPage extends StatefulWidget{
  var paymenttype,shippingAdd,billingAdd;
  String firstName,lastName,phone,email,address,city,zip,country;
  String deleveryType;
  double prices;
  List<OrderListModel> orderListArray;
  ConfirmOrderPage(this.firstName, this.lastName,this.phone, this.email, this.address,
      this.city,this.zip,this.country,this.deleveryType, this.prices, this.orderListArray );

  @override
  State<StatefulWidget> createState() =>ConfirmOrderUi(this.firstName, this.lastName,this.phone, this.email, this.address,
      this.city,this.zip,this.country,this.deleveryType, this.prices, this.orderListArray);

}

class ConfirmOrderUi extends State<ConfirmOrderPage>{
  int items=1;
  var paymenttype,shippingAdd,billingAdd;
  String firstName,lastName,phone,email,address,city,zip,country;
  String deleveryType;
  double prices;
  List<OrderListModel> orderListArray;
  ConfirmOrderUi(this.firstName, this.lastName,this.phone, this.email, this.address,
      this.city,this.zip,this.country,this.deleveryType, this.prices, this.orderListArray);
  DatabaseHelper database = DatabaseHelper();
  List<CartModel> cartlistdata=List<CartModel>();
  bool isVisivility=false;
  @override
  Widget build(BuildContext context) {
    if(cartlistdata.isEmpty){
      getCartListDatas();
    }
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
        child:isVisivility?Visibility(visible: isVisivility,
            child: Container(
              child: StreamBuilder(
                stream: confirmOrderBloc.getOrderSubject.stream,
                builder: (context, Object snapShot){
                  if (!snapShot.toString().isEmpty) {

                    if(snapShot.toString().length<0){
                      return _buildErrorWidget("No Order Data Found");
                    }else{
                      Configuration alertdialog=Configuration();
                    /*  WidgetsBinding.instance.addPostFrameCallback((_){
                        alertdialog.successSweetAlert(context, "Your login Success", "success", () => Home());
                      });*/
                      return Container();
                    }
                  }
                  else {
                    return _buildLoadingWidget();
                  }
                },
              ),
            )):
        Visibility(visible: !isVisivility,
            child: Column(
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
                          Text("MRP $prices BDT"),
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
                child: createConfirmListView()
            ),
            Expanded(child: Align(alignment:Alignment.bottomLeft ,
              child: InkWell(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                          child: Container(
                            height: 100,
                            child: Column(
                              children: [

                                SizedBox(height: 20,),
                                Text("Do You Want To Confirm Order",style: TextStyle(fontSize: 20,),),
                                SizedBox(height: 20,),

                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        child: Text("Confirm",style: TextStyle(fontSize: 20,),),
                                        onTap: (){
                                          /*setState(() {
                                            isVisivility=true;
                                          });*/
                                          OrderRepository orderRepository=new OrderRepository();
                                          var myresponse=orderRepository.fetchOrderList(billing_firstName: firstName, billing_lastName: lastName, billing_phone: phone,
                                              billing_email: email, billing_city: city, billing_country:country, billing_zip: zip,
                                              billing_address: address,orderListArray: orderListArray);
                                            /*  confirmOrderBloc..getOrderRepositoryResponse(this.firstName, this.lastName,this.phone,
                                              this.email, this.address,
                                              this.city,this.zip,this.country,this.deleveryType,this.prices, this.orderListArray);
                                           */
                                              if(myresponse.toString().length>1){
                                                print(myresponse.toString());
                                              }

                                        },
                                      ),
                                      SizedBox(width: 20,),
                                      InkWell(onTap:(){
                                        Navigator.pop(context);
                                      },
                                        child: Text("Cancel",style: TextStyle(fontSize: 20,),),),
                                      SizedBox(width: 20,),
                                    ],),)
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                    color: Colors.red,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                    )),),))

          ],) ),
      ),
    );
  }

  @override
  void dispose() {
    confirmOrderBloc..drainStream();
  }


  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CircularProgressIndicator(),
            )
          ],
        ));
  }
  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occured: $error"),
          ],
        ));
  }
  Widget createConfirmListView(){
    return ListView.builder(
      itemCount: cartlistdata.length,
      itemBuilder: (context,value){
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

                        Container(
                          width: 200,
                          child:Padding(padding: EdgeInsets.all(1),
                            child: Text(cartlistdata[value].product_title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: CustomColors.GreenDark,
                                  fontWeight: FontWeight.bold),),) ,) ,
                        SizedBox(height: 5,),
                        Text("MRP: ${cartlistdata[value].product_price} BDT"),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("MRP: ${getProductPrice(cartlistdata[value].product_price,cartlistdata[value].product_quantity)} BDT",
                              style: TextStyle(
                                  color: CustomColors.GreenDark
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width*.04,
                            ),
                            Text("Quantity : ${cartlistdata[value].product_quantity}",
                              style: TextStyle(
                                  color: CustomColors.GreenDark
                              ),
                            ),

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
      },);
  }
  void getCartListDatas() async {
    Future<List<CartModel>> cartList = database.getSavedProductList("cart");
    cartList.then((value) {
      setState(() {
        cartlistdata.clear();
        cartlistdata = value;
        items=cartlistdata.length;
      });
    });
  }

  getProductPrice(String product_price, String product_quantity) {
    double productPrice=double.parse(product_price);
    int quantity=int.parse(product_quantity);

    return productPrice*quantity;
  }
}
