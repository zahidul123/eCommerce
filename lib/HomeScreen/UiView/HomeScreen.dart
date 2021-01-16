
import 'package:ciblecommerce/CartListAndOrder/AddToCart/Cartmodel.dart';
import 'package:ciblecommerce/CartListAndOrder/AddToCart/DatabaseHelperclass.dart';
import 'package:ciblecommerce/CartListAndOrder/CartListUi/CartListUi.dart';
import 'package:connectivity/connectivity.dart';
import 'package:ciblecommerce/DashBoard/DashBoardUiView/UiView/DashBoardUiView.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/UiView/ProductDetailsUi.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/Product_Search/SearchProduct.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:ciblecommerce/utils/UserLogincheck.dart';
import 'package:ciblecommerce/HomeScreen/BlocStates/CategoryBlocState/BooklistCategory_Bloc.dart';
import 'package:ciblecommerce/HomeScreen/BlocStates/CategoryBlocState/BooklistCategory_Event.dart';
import 'package:ciblecommerce/HomeScreen/BlocStates/CategoryBlocState/BooklistCategory_State.dart';
import 'package:ciblecommerce/HomeScreen/BlocStates/ProductListBlocState/ProductList_Bloc.dart';
import 'package:ciblecommerce/HomeScreen/BlocStates/ProductListBlocState/ProductList_Event.dart';
import 'package:ciblecommerce/HomeScreen/BlocStates/ProductListBlocState/ProductList_State.dart';
import 'package:ciblecommerce/HomeScreen/Data/model/Category_Data_Model.dart';
import 'package:ciblecommerce/HomeScreen/Data/model/Product_List_Data_Model.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/OrderList/OrderListUi.dart';
import 'package:ciblecommerce/WishList/WishList.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ciblecommerce/LoginRegistration/UiView/LoginRegUI.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreen();
  }
}

class HomeScreen extends State<Home> with SingleTickerProviderStateMixin {

  TextEditingController searchcontroll = TextEditingController();
  int _selectedIndex = 0;
  int _currentIndex = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];
  List<CatList>categoryList;
  List<ProductList>productListtemp;

  List<CartModel>cartListNav;
  List<CartModel>wishListNav;
  TabController _tabController;
  BooklistCategoryBloc booklistbloc;
  ProductListBloc productListBloc;
  Configuration configuration;
  bool internetconnected;
  bool checkloginstatus;
  bool checkCartData;
  bool checkWishData;
  @override
  void initState() {
    // TODO: implement initState
    permissionStatus();
    internetconnected=false;
    configuration=Configuration();
    checkConntction();
      categoryList=List<CatList>();
      productListtemp=List<ProductList>();
      booklistbloc = BlocProvider.of<BooklistCategoryBloc>(context);
      booklistbloc.add(FetchBooklistCategoryEvent());
      productListBloc=BlocProvider.of<ProductListBloc>(context);
      productListBloc.add(FetchProductListEvent());
      _tabController = new TabController(length: 3, vsync: this);
      checkloginstatus=false;
      checkCartData=false;
      checkWishData=false;
      getCartWishData();
     cartListNav=List<CartModel>();
     wishListNav=List<CartModel>();
    super.initState();
  }
  int wishlistlength=0;
  int cartlistlength=0;
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

    // final BooklistCategoryBloc bloc = BlocProvider.of<BooklistCategoryBloc>(context);
    // TODO: implement build
    return WillPopScope(
      onWillPop: onBackPressed, //this is back pressed button
      child: Builder(
        builder: (context) {
          return internetconnected?
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              iconTheme: IconThemeData(color: CustomColors.optimal_black),
              title: Center(
                  child: Text("CIBL E-Commerce",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: CustomColors.optimal_black))),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderlistUi()));
                    },
                    child: Stack(
                      children: <Widget>[
                        Center(
                            child: Padding(
                          padding: EdgeInsets.only(right: 5),
                             child: Icon(Icons.shop),
                        )),
                        Positioned(
                          top: 4,
                          right: 0,
                          child: new Container(
                            padding: EdgeInsets.all(3),
                            decoration: new BoxDecoration(
                              color: CustomColors.red,
                              borderRadius: BorderRadius.circular(99),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1),
                              child: Text(
                                '15',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            drawer: buildNavDrawer(context),
            body: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xffEFEFEF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: InkWell(
                              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchProduct(categoryList,productListtemp))),
                              child: TextField(
                                onChanged: (value) {},
                                style: TextStyle(color: CustomColors.optimal_black),
                                controller: searchcontroll,
                                decoration: InputDecoration(
                                    hintText: "Search",
                                    prefixIcon:
                                    Icon(Icons.search, color: CustomColors.optimal_black),
                                    border: InputBorder.none),
                                enabled: false,
                              ),
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: ListView(
                        children: <Widget>[
                          Container(

                            child: CarouselSlider(
                                items: imgList.map((images) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        color: Colors.blueAccent,
                                        child: Image.network(
                                          images,
                                          fit: BoxFit.cover,
                                        ),
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
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: getNewsFeed(),
                                ),
                                Expanded(child: getGiftCards()),
                                Expanded(
                                  child: getcampaining(),
                                ),
                                Expanded(
                                  child: getOrder(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            child: Container(height: 2, color: Colors.grey),
                          ),
                          Card(
                            child: Container(
                              height: 500,
                              child: Scaffold(
                                appBar: PreferredSize(
                                    preferredSize: Size.fromHeight(50.0),
                                    // here the desired height
                                    child: AppBar(
                                      elevation: 0,
                                      bottom: TabBar(
                                        unselectedLabelColor: Colors.black38,
                                        labelColor: Colors.black,
                                        tabs: [
                                          Tab(
                                            /*icon:Icon(Icons.call)*/
                                            text: "Categoris",
                                          ),
                                          Tab(
                                            /*icon:Icon(Icons.chat)*/
                                            text: "Brands",
                                          ),
                                          Tab(
                                            /*icon:  Icon(Icons.notifications)*/
                                            text: "Products",
                                          )
                                        ],
                                        controller: _tabController,
                                        indicatorColor: Colors.green,
                                        indicatorSize: TabBarIndicatorSize.tab,
                                      ),
                                      bottomOpacity: 1,
                                    )),
                                body: TabBarView(

                                  children: [
                                    Container(

                                      child: BlocListener<BooklistCategoryBloc,
                                          BooklistCategoryState>(
                                        listener: (context, state) {
                                          if (state
                                              is BooklistCategoryErrorState) {
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text(state.errormessage),
                                              ),
                                            );
                                          }
                                        },
                                        child: BlocBuilder<BooklistCategoryBloc,
                                            BooklistCategoryState>(
                                          builder: (context, state) {
                                            if (state
                                                is BooklistCategoryInitialState) {
                                              return buildLoading();
                                            } else if (state
                                                is BooklistCategoryLoadingState) {
                                              return buildLoading();
                                            } else if (state
                                                is BooklistCategoryLoadedState) {
                                              List<CatList> booklist=List<CatList>();
                                              booklist=state.booklist;
                                              if(booklist.length>0){
                                                  categoryList.addAll(booklist);
                                              }
                                              return buildArticleList(state.booklist);
                                            } else {
                                              BooklistCategoryErrorState
                                                  builde = BooklistCategoryErrorState();
                                              return buildErrorUi(builde.errormessage);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Text("This is chat Tab View"),

                                    Container(

                                         child: BlocBuilder<ProductListBloc,ProductListState>(
                                        builder: (context,state){
                                          if(state is ProductListInitialState ){
                                            return buildLoading();
                                          }else if(state is ProductListLoadingState){
                                            return buildLoading();
                                          }else if(state is ProductListLoadedState){
                                            return buildProductList(state.productList);
                                          }else{
                                            ProductListErrorState error=ProductListErrorState();
                                            return buildErrorUi(error.message);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                  controller: _tabController,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: buildBottomNavBar(),
          ):
          Scaffold(body: Container(
            child: Center(child: Text("please check your internet connection",style: TextStyle(fontSize: 20,color: CustomColors.red,fontWeight: FontWeight.bold),),),
          ),);
        },
      ),
    );
  }

  Widget buildNavDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.70,
              child: DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ic_icons/ciblLogo.png"),
                        fit: BoxFit.contain)),
                child: Text("Header"),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text("Dashboard"),
                onTap: () {
                  Navigator.of(context).pop();
                  checkuserLogin();
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text("Wish List"),
                onTap: () {
                  Navigator.of(context).pop();
                  checkWishuserLogin();
                },
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: Text("Cart"),
                onTap: () {
                  Navigator.of(context).pop();
                  checkCartuserLogin();
                },
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text("My order"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderlistUi()));
                },
              ),
            ]),
          )
        ],
      ),
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

      }
    });
  }

  Widget buildBottomNavBar() {
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

  Widget getNewsFeed() {
    return Column(
      children: <Widget>[
        Expanded(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xffCACECE),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xffCACECE),
              backgroundImage: AssetImage('assets/ic_icons/author.png'),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text("Newsfeed")
      ],
    );
  }

  Widget getGiftCards() {
    return Column(
      children: <Widget>[
        Expanded(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xffCACECE),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xffCACECE),
              backgroundImage: AssetImage('assets/ic_icons/cart.png'),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text("Categoris")
      ],
    );
  }

  Widget getcampaining() {
    return Column(
      children: <Widget>[
        Expanded(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xffCACECE),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xffCACECE),
              backgroundImage: AssetImage(
                'assets/ic_icons/cart.png',
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text("Cart")
      ],
    );
  }

  Widget getOrder() {
    return Column(
      children: <Widget>[
        Expanded(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xffCACECE),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xffCACECE),
              backgroundImage: AssetImage('assets/ic_icons/cart.png'),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text("Favourite")
      ],
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget colobuildArticleList(List<CatList> booklist) {
    categoryList.clear();
    categoryList.addAll(booklist);

    return GridView.builder(
        shrinkWrap: false,
        itemCount: booklist.length,
        physics: ScrollPhysics()/*NeverScrollableScrollPhysics()*/,
        padding: EdgeInsets.only(left: 16,right: 16,bottom: 65),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, position) {
          return Container(
            width: 100,
            height: 100,
            child: InkWell(
              child: Card(
                elevation: 5,
                child: Container(
                  height: 50,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
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
                      Expanded(
                          child: Padding(
                            child:FittedBox(child: Text(booklist[position].categoryName,
                              style: TextStyle(fontStyle: FontStyle.italic),
                              textAlign: TextAlign.center,),
                              fit: BoxFit.scaleDown,),
                            padding: EdgeInsets.all(5),
                          ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductDetailsUi(product_id: categoryList[position].categoryId)));
              },
            ) ,
          );
        });
    /*ListView.builder(
      itemCount: booklist.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListTile(
              leading:Text(booklist[pos].categoryName),
              title: Text(booklist[pos].created),
              subtitle: Text(booklist[pos].categoryId),
            ),

          ),
        );
      },
    )*/
  }

  Widget buildErrorUi(String errormessage) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          errormessage==null?"No data found":errormessage,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Future<bool> onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text(
              'Are you sure?',
              style: TextStyle(color: CustomColors.PurpleLight),
            ),
            content: Text('Do you want to exit this App !!!'),
            actions: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(width: 30),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES"),
              ),
              SizedBox(width: 10),
            ],
          ),
        ) ??
        false;
  }

  Widget buildProductList(List<ProductList> productList) {
    productListtemp.clear();
    productListtemp.addAll(productList);
    return GridView.builder(
        shrinkWrap: true,
        itemCount: productList.length,
        physics: ScrollPhysics(),
        padding: EdgeInsets.only(left: 16,right: 16,bottom: 65)/*symmetric(horizontal: 16)*/,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, position) {
          return InkWell(
            child: Card(
              elevation: 5,
              child: Container(
                height: 50,
                child: Column(
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
                                fit: BoxFit.cover,
                                image: AssetImage('assets/ic_icons/lather.jpg'),
                              ))),
                    ),
                    Expanded(
                      child: Padding(
                        child:FittedBox(child: Text(productList[position].categoryName,
                          style: TextStyle(fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center,),
                          fit: BoxFit.scaleDown,),
                        padding: EdgeInsets.all(5),
                      ),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductDetailsUi(product_id: productList[position].productId)));
            },
          );
        });

  }

  Future permissionStatus() async {
    var status=await Permission.phone.status;
    if(!status.isGranted){
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.phone,
      ].request();
    }

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

   checkConntction() async{
     var connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.mobile) {
       setState(() {
     internetconnected=true;
     });
     } else if (connectivityResult == ConnectivityResult.wifi) {
       setState(() {
         internetconnected=true;
       });
     }else{
       setState(() {
         internetconnected=false;
       });
     }

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
