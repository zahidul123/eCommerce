
import 'package:ciblecommerce/CartListAndOrder/AddToCart/Cartmodel.dart';
import 'package:ciblecommerce/CartListAndOrder/AddToCart/DatabaseHelperclass.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class WishList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WishListUi();
  }

}

class WishListUi extends State<WishList>{
  List<CartModel>cartlistdata;
  DatabaseHelper database=DatabaseHelper();
  bool progressbarShow;
  @override
  void initState() {
    // TODO: implement initState
    progressbarShow=true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(cartlistdata==null){
      cartlistdata=List<CartModel>();
      getCartListDatas();
    }
   /* if(cartlistdata.length>=0){
      progressbarShow=true;
    }
    if(cartlistdata.isEmpty){
      Future.delayed(Duration(seconds: 2),(){
        progressbarShow=true;
      });
    }*/

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Wish List',
            style: TextStyle(color: Colors.black),
          )),
      body:Container(
        child:wishListview(),
      ),
    );
  }
  void getCartListDatas() {
    Future<List<CartModel>>cartList=database.getSavedProductList("wish");
    cartList.then((value){
      setState(() {
        cartlistdata=value;
        progressbarShow=false;
      });
    });
  }

  wishListview() {
    return cartlistdata.length<1?
        cartlistdata.isEmpty&&progressbarShow==true?ShowProgressbar():
        Center(child:Text("You have no data in wish list",style: TextStyle(fontSize: 16,color: Colors.red)),) :
    ListView.builder(
        itemCount: cartlistdata.length,
        itemBuilder: (BuildContext context,int position){
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
                            child:Text(cartlistdata[position].product_title,style: TextStyle(
                                fontSize: 16,
                                color: CustomColors.GreenDark,
                                fontWeight: FontWeight.bold),) ,) ,
                          SizedBox(height: 5,),
                          Text("MRP:"+cartlistdata[position].product_price+" BDT"),
                          SizedBox(height:8,),

                          InkWell(onTap:(){
                            addToCart(cartlistdata[position]);
                          },
                          child:Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              shape: BoxShape.rectangle,
                              border: Border.all(color: CustomColors.red,
                                  width: 2),
                            ),
                            child: Padding(padding: EdgeInsets.all(5),
                              child: Text("Add To Bag",style: TextStyle(fontWeight: FontWeight.w600),),),
                          ) ,)

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

  ShowProgressbar() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  void deletewishItem(String product_id, String product_list_type) async{
    int result = await database.deleteNote(product_id,"wish");
    if (result != 0) {
      progressbarShow=true;
      getCartListDatas();
      _showSnackBar(context, 'Wish List Deleted Successfully');
    }else{
      Toast.show("Product does not deleted", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
    }
  }
  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void addToCart(CartModel cartModel) async{
    int result = await database.deleteNote(cartModel.product_id,"wish");
    int result2=await database.insertNote(CartModel(cartModel.product_id,cartModel.product_title,
        cartModel.product_description,cartModel.product_price, '1',cartModel.product_image,"true","cart"),"cart");
    if (result != 0) {
      getCartListDatas();
      _showSnackBar(context, 'Add to Bag Successfully');
    }
  }
}