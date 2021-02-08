import 'package:ciblecommerce/CartListAndOrder/AddToCart/Cartmodel.dart';
import 'package:ciblecommerce/CartListAndOrder/AddToCart/DatabaseHelperclass.dart';
import 'package:ciblecommerce/CartListAndOrder/CartListUi/CartListUi.dart';
import 'package:ciblecommerce/DashBoard/DashBoardUiView/UiView/DashBoardUiView.dart';
import 'package:ciblecommerce/HomeScreen/UiView/HomeScreen.dart';
import 'package:ciblecommerce/LoginRegistration/UiView/LoginRegUI.dart';
import 'package:ciblecommerce/WishList/WishList.dart';
import 'package:ciblecommerce/utils/UserLogincheck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottonNavUi();
  }
  
}

class BottonNavUi  extends State<BottomNavigationWidget>{

  List<CartModel>cartListNav;
  List<CartModel>wishListNav;
  int wishlistlength=0;
  int cartlistlength=0;
  int _selectedIndex = 0;
  bool checkloginstatus;
  bool checkCartData;
  bool checkWishData;

  @override
  void initState() {
    // TODO: implement initState
    checkCartData=false;
    checkWishData=false;
    getCartWishData();
    cartListNav=List<CartModel>();
    wishListNav=List<CartModel>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    wishlistlength=wishListNav.length;

    if(cartListNav.length>0){
      checkCartData=true;

    }
    if(wishListNav.length>0){

      checkWishData=true;

    }
    if(checkloginstatus==true){
      retriveDatas();
    }

    cartlistlength=cartListNav.length;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
            icon: checkloginstatus==true&&checkWishData==true?
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.favorite_border),
                ),
                Positioned(
                  top: -1,
                  right: 1,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '${wishlistlength}',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ):
            checkloginstatus==true&&checkWishData==false?Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.favorite_border),
            ):Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.favorite_border),
            ),
            title: Text('Wish List'),
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
          icon: checkloginstatus==true&&checkCartData==true?
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.add_shopping_cart),
              ),
              Positioned(
                top: -.5,
                right: 3,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '${cartListNav.length}',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ):
          checkloginstatus==true&&checkCartData==false?Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.add_shopping_cart),
          ):
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.add_shopping_cart),
          ),
          title: Text('Cart'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account), title: Text("Dashboard")),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) {
        checkuserLogin();

      } else if (index == 2) {
        checkCartuserLogin();
      } else if (index == 1) {
        checkWishuserLogin();
      }else if(index==0){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Home(),
        ), (route) => false);
      }
    });
  }

  Future checkuserLogin() async {
    final logincheck= await LoginCheck.checkUserLogin();
    if(logincheck =="Logged"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
    }else
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRegUI(key: Key("HomeScreen"),)));

  }

  void checkCartuserLogin() async {
    final logincheck= await LoginCheck.checkUserLogin();
    if(logincheck =="Logged"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => CartListUi()));
    }else
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRegUI(key: Key("HomeScreen"),)));

  }

  void checkWishuserLogin() async {
    final logincheck= await LoginCheck.checkUserLogin();
    if(logincheck =="Logged"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => WishList()));
    }else
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRegUI(key: Key("HomeScreen"),)));

  }

  getCartWishData() async {
    final logincheck= await LoginCheck.checkUserLogin();
    if(logincheck =="Logged"){
      setState(() {
        checkloginstatus=true;
      });
      retriveDatas();
    }

  }

  void retriveDatas() {
    DatabaseHelper database=DatabaseHelper();
    Future<List<CartModel>>cartList=database.getSavedProductList("cart");
    cartList.then((value){
      setState(() {

        cartListNav=value;
      });
    });
    Future<List<CartModel>>wishList=database.getSavedProductList("wish");
    wishList.then((value){
      setState(() {
        wishListNav=value;
      });
    });

  }
}