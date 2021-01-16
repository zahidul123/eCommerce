
import 'package:ciblecommerce/CartListAndOrder/AddToCart/Cartmodel.dart';
import 'package:ciblecommerce/CartListAndOrder/AddToCart/DatabaseHelperclass.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CartListUi extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartListAndOrderShow();
  }
}

class CartListAndOrderShow extends State<CartListUi> {
  List<CartModel>cartlistdata;
  DatabaseHelper database=DatabaseHelper();
  double totalprice=0.00;
  String productprices;
  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    if(cartlistdata==null){
      cartlistdata=List<CartModel>();
     // initialShahredpreference();
      getCartListDatas();
    }
    double prices=0.0;
    int quantityitem=0;
    for(int position=0;position<cartlistdata.length;position++){
      String price=cartlistdata[position].product_price;
      String quantity=cartlistdata[position].product_quantity;
      quantityitem=quantityitem+int.parse(quantity);
      prices=prices+(int.parse(quantity)*double.parse(price));
    }
   // sharedPreferences.setString("totalpriceCart",prices.toString());
    //productprices=sharedPreferences.getString("totalpriceCart");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Cart List',
            style: TextStyle(color: Colors.black),
          )),
      body: Container(
        child: ShowCartlist(),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 1),
              child: Container(
                width: MediaQuery.of(context).size.width * .51,
                height: 50,
                decoration: BoxDecoration(
                  color: CustomColors.TextGrey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2)),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 5,),
                      Text(
                        "Total: ${prices} MRP",
                        style: TextStyle(
                            fontSize: 20,
                            color: CustomColors.TextBlack,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$quantityitem items to buy",
                        style: TextStyle(
                            fontSize: 14, color: CustomColors.TextBlack),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Container(
                width: MediaQuery.of(context).size.width * .48,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2)),
                ),
                child: FlatButton(
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



  ShowCartlist() {


    return cartlistdata.length<0?Text("You have no data in Cart list"):
    ListView.builder(
      itemCount: cartlistdata.length,
        shrinkWrap: true,
        itemBuilder: (context,position){
        String title=cartlistdata[position].product_title;
        String price=cartlistdata[position].product_price;
        String quantity=cartlistdata[position].product_quantity;
        String pid=cartlistdata[position].product_id;
        String description=cartlistdata[position].product_description;
        String listtype=cartlistdata[position].product_list_type;
        String image=cartlistdata[position].product_image;
        /*totalprice=sharedPreferences.getString("totalpriceCart")!=null?double.parse(sharedPreferences.getString("totalpriceCart")):0;
        totalprice=totalprice+(int.parse(quantity)*double.parse(price));
        sharedPreferences.setString("totalpriceCart", totalprice.toString());*/
        int count=0;
        return Card(
          color: Colors.white,
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
                      Row(
                        mainAxisAlignment:MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(width: MediaQuery.of(context).size.width*.6,),
                          Padding(padding: EdgeInsets.only(top: 3),
                            child: InkWell(
                              child: Icon(Icons.delete),
                              onTap: (){
                                deletewishItem(cartlistdata[position].product_id,cartlistdata[position].product_list_type);
                              },
                            ),)
                        ],),
                      Flexible(
                        child:Text(/*"Leather bag for men Official"*/title,style: TextStyle(
                            fontSize: 16,
                            color: CustomColors.GreenDark,
                            fontWeight: FontWeight.bold),) ,) ,
                      SizedBox(height: 5,),
                      Text("MRP: $price BDT"),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("MRP: ${int.parse(quantity)*double.parse(price)} BDT"),
                          SizedBox(width: MediaQuery.of(context).size.width*.19,),
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  if(int.parse(quantity)>1)
                                 {
                                   setState(() {
                                     count=int.parse(quantity)-1;
                                     totalprice=0.0;
                                   });
                                   //sharedPreferences.setString("totalpriceCart","0");
                                   updatevalue(pid, title, description, price, count, image, listtype);
                                 }

                                },
                                child:Container(
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white,),
                                  child:InkWell(
                                    child: Text("-",textAlign: TextAlign.center,style: TextStyle(
                                        fontSize: 20,
                                        color: CustomColors.BlueDark,
                                        fontWeight: FontWeight.bold)),
                                  ),
                                ) ,
                              )
                              ,
                              SizedBox(width: 5,),
                              Text(quantity!=""?quantity:"1",style: TextStyle(
                                  fontSize: 20,
                                  color: CustomColors.TextGrey,
                                  fontWeight: FontWeight.bold)),
                              SizedBox(width: 5,),
                              InkWell(
                                onTap: (){
                                  if(int.parse(quantity)>0){
                                    setState(() {
                                      count=int.parse(quantity)+1;
                                      totalprice=0.0;
                                    });
                                   // sharedPreferences.setString("totalpriceCart",totalprice.toString());
                                    updatevalue(pid, title, description, price, count, image, listtype);
                                  }

                                },
                                child:Container(
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white,),
                                  child:InkWell(
                                    child: Text("+",textAlign: TextAlign.center,style: TextStyle(
                                        fontSize: 20,
                                        color: CustomColors.BlueDark,
                                        fontWeight: FontWeight.bold)),
                                  ),
                                ) ,
                              )
                              ,

                            ],)
                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        );
        });
  }


  void getCartListDatas() {
    Future<List<CartModel>>cartList=database.getSavedProductList("cart");
    cartList.then((value){
      setState(() {
        cartlistdata=value;
      });
    });

  }

  void updatevalue(String pid, String title, String description, String price, int count, String image, String listtype) async {
    int result= await database.updateNote(CartModel(pid, title,
        description, price, count.toString(), image, listtype));
    if(result!=0){
      getCartListDatas();
    }
  }

  void initialShahredpreference() async {
     sharedPreferences=await SharedPreferences.getInstance();
     sharedPreferences.setString("totalpriceCart","0.0");
  }

  void deletewishItem(String product_id, String product_list_type) async{
    int result = await database.deleteNote(product_id,product_list_type);
    if (result != 0) {
      getCartListDatas();
      _showSnackBar(context, 'Wish List Deleted Successfully');
    }
  }
  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }


}
