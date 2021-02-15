import 'package:ciblecommerce/CartListAndOrder/AddToCart/Cartmodel.dart';
import 'package:ciblecommerce/CartListAndOrder/AddToCart/DatabaseHelperclass.dart';
import 'package:ciblecommerce/CartListAndOrder/CartListUi/OrderListModel.dart';
import 'package:ciblecommerce/LoginRegistration/UiView/LoginRegUI.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/BlocStates/ProdectDetails_Event.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/BlocStates/ProdectDetails_States.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/BlocStates/ProductDetails_Bloc.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/Datas/SaveCartData.dart';
import 'package:ciblecommerce/ProductOrder/Address/UiView/DeliveryLocationUi.dart';
import 'package:ciblecommerce/utils/UserLogincheck.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:ciblecommerce/widgets/cart_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsUi extends StatefulWidget {
  String product_id;

  ProductDetailsUi({@required this.product_id});

  @override
  State<StatefulWidget> createState() {
    return ProductDetails(product_id: product_id);
  }
}

class ProductDetails extends State<ProductDetailsUi> {
  ProductDetailsBloc productDetailsBloc;
  String product_id;

  ProductDetails({@required this.product_id});
  List<OrderListModel> orderListArray = List<OrderListModel>();
  String product_title;
  String product_description;
  String product_price;
  String product_quantity;
  String product_image;
  String product_list_type;
  DatabaseHelper helper = DatabaseHelper();

  @override
  void initState() {
    productDetailsBloc = BlocProvider.of<ProductDetailsBloc>(context);
    productDetailsBloc.add(FetchProductDetailsEvent(product_id: product_id));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            'Product Details',
            style: TextStyle(color: Colors.black),
          )),
      body: Container(
        child: BlocListener<ProductDetailsBloc, ProductDetails_State>(
          listener: (context, state) {
            if (state is ProductDetailsErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errormessage),
                ),
              );
            }
          },
          child: BlocBuilder<ProductDetailsBloc, ProductDetails_State>(
            builder: (context, state) {
              if (state is ProductDetailsInitialState) {
                return buildLoading();
              } else if (state is ProductDetailsLOadingState) {
                return buildLoading();
              } else if (state is ProductDetailsLoadedState) {
                var response = state.response;
                return Detail_ShowResponse(response);
              }
            },
          ),
        ),
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
                  color: CustomColors.BlueDark,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(2)),
                ),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          checkuserLogin();
                        },
                        child: Text(
                          "Add to chart",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
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
                  onPressed: () {
                    checkBuyLogin();
                  },
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

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget Detail_ShowResponse(response) {
    product_title = response["product_name"];
    product_description = response["description"];
    product_price = response['selling_price'];
    product_image = response['picture'];
    String category = response["category_name"];
    String brand = response["publisher_name"];
    String country = response["country"];

    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 1, right: 1, top: 5, bottom: 3),
            child: Container(
                height: MediaQuery.of(context).size.width * .5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/ic_icons/lather.jpg'),
                    ))),
          ),
          Container(
            color: CustomColors.GreyBackground,
            height: 2,
          ),
          Container(
            height: 80,
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: Wrap(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 5,),
                      Padding(padding: EdgeInsets.only(left: 5,bottom: 2),
                       child: Text(product_title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("Leather: Multicolor",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: CustomColors.TextGrey),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            child: Center(
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Center(
                      child: SmoothStarRating(
                        rating: 3,
                        size: 20,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        starCount: 5,
                        allowHalfRating: true,
                        spacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("3 Reviews",
                        style: TextStyle(
                            fontSize: 14, color: CustomColors.GreenLight),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: Text("Description:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: CustomColors.TextGrey),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2),
                  ),
                  Text(
                      product_description != ""
                          ? """$product_description"""
                          : """Looking to obtain the position of Software Developer in a fast-paced tech environment to utilize my skills in computer science and extensive experience in developing customized software based on varying client demands. I am passionate to solve problems and try to learn something new. Collaborating with my team member new innovation is my dream and make it programmatically using agile methods. Learn and apply is my main objective to grow my and company reputation.""",
                      style: TextStyle(fontSize: 15, color: CustomColors.TextGrey),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    child: Text("Specifications:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: CustomColors.TextGrey),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text("Category",
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors.TextGrey)),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text("$category",
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors.TextGrey),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text("Brand",
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors.TextGrey)),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text("$brand",
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors.TextGrey),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text("Material",
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors.TextGrey)),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text("Leather",
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors.TextGrey),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text("Gender",
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors.TextGrey)),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text("Men and Women ",
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors.TextGrey),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text("Country of Origin",
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors.TextGrey)),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text("$country",
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors.TextGrey),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            elevation: 5,
            child: Container(
              width: MediaQuery.of(context).size.width * .48,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2), topRight: Radius.circular(2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  FlatButton(
                    onPressed: () {
                      checkwishlogin();
                    },
                    child: Text(
                      "Wish List",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future checkuserLogin() async {
    final logincheck = await LoginCheck.checkUserLogin();
    if (logincheck == "Logged") {
      saveDataToCartWish("cart");
    } else
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginRegUI(
                    key: Key("HomeScreen"),
                  )));
  }

  void saveDataToCartWish(String choose) async {
    int result;

    if (choose == "cart") {
      /*SaveCardDataInRepository saveCardDataInRepository=SaveCardDataInRepository();
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String customer_id=sharedPreferences.getString("user_id");

    final response=  saveCardDataInRepository.ImpSaveCartData(customer_id: customer_id, book_id: product_id,
        rating:product_title ,description: product_description);*/
      result = await helper.insertNote(CartModel(product_id, product_title,
          product_description, product_price, '1', product_image,"true", choose),"cart");

    } else {
      result = await helper.insertNote(CartModel(product_id, product_title,
          product_description, product_price, '1', product_image,"true", choose),"wish");
    }
    if (result != 0) {
      debugPrint('$result');
      Toast.show("Product Added Successfully", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
    } else {
      Toast.show("Product does not added or duplicate", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
      debugPrint('$result');
    }
  }

  void checkwishlogin() async {
    final logincheck = await LoginCheck.checkUserLogin();
    if (logincheck == "Logged") {
      saveDataToCartWish("wish");
    } else
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginRegUI(
                key: Key("HomeScreen"),
              )));

  }

  void checkBuyLogin() async{
    final logincheck = await LoginCheck.checkUserLogin();
   // if (logincheck == "Logged") {
      showModalbottomsheet();
   /* } else
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginRegUI(
                key: Key("HomeScreen"),
              )));*/
  }

 showModalbottomsheet() {
    return showModalBottomSheet(
      //barrierColor: Colors.black.withAlpha(2),
        backgroundColor: Color(0xFF737373),
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height*.24,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: <Widget>[
                  CartItemWidget(product_title,product_price),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Container(
                        width:
                        MediaQuery.of(context).size.width *
                            .97,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              topRight: Radius.circular(2)),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Check Out",
                            style:
                            TextStyle(color: Colors.white),
                          ),
                          onPressed: (){
                            orderListArray.add(OrderListModel(product_id, "1"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeliveryLocationUi(double.parse(CartItemWidget.of(context).totalprice),orderListArray )));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
 }

}
