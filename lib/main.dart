import 'dart:async';
import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoEdit/BlocState/AccountInfoEdit_Bloc.dart';
import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoEdit/Data/AccountInfoEditRepository.dart';
import 'package:ciblecommerce/DashBoard/ChangePassword/BlocStates/ChangePassword_Bloc.dart';
import 'package:ciblecommerce/DashBoard/ChangePassword/Data/ChangePassword_Repository.dart';
import 'package:ciblecommerce/DashBoard/DashBoardUiView/BlocStates/DashBoard_Bloc.dart';
import 'package:ciblecommerce/DashBoard/DashBoardUiView/Data/DashBoard_DataRepository.dart';
import 'package:ciblecommerce/HomeScreen/BlocStates/ProductListBlocState/ProductList_Bloc.dart';
import 'package:ciblecommerce/HomeScreen/Data/repository/Categories_Item.dart';
import 'package:ciblecommerce/HomeScreen/Data/repository/Product_List_Repository.dart';
import 'package:ciblecommerce/HomeScreen/UiView/HomeScreen.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/LoginBlocState/Login_Bloc.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/RegistrationBlocStatement/Registration_Bloc.dart';
import 'package:ciblecommerce/LoginRegistration/Data/Login_Repository.dart';
import 'package:ciblecommerce/LoginRegistration/Data/Registration_Repository.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/BlocStates/CategoryListBloc.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/CategoryWisePList/Data/repository/DataRepository.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/BlocStates/ProductDetails_Bloc.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/ProductDetails/Datas/ProductDetailsRepository.dart';
import 'package:ciblecommerce/splashScreen/SplashScreen.dart';
import 'package:ciblecommerce/LoginRegistration/UiView/LoginRegUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeScreen/BlocStates/CategoryBlocState/BooklistCategory_Bloc.dart';

void main(){
  return runApp(MultiBlocProvider(
    providers: [
      BlocProvider<BooklistCategoryBloc>(create: (_)=> BooklistCategoryBloc(categoryRepository: CategoryRepositoryImp()) ,),
     BlocProvider<ProductListBloc>(create: (_)=>ProductListBloc(productListRepository: ProductListRepositoryImp()),),
      BlocProvider<LoginBloc>(create: (_) =>LoginBloc(loginRepository: LoginRepositoryImp()),),
      BlocProvider<RegistrationBloc>(create: (_)=>RegistrationBloc(registrationRepository: RegistrationRepositoryImp()),),
      BlocProvider<ChangePasswordBloc>(create: (_)=>ChangePasswordBloc(changePassword_Repository: ChangePassword_RepositoryImp()),),
      BlocProvider<DashBoardBloc>(create: (_)=>DashBoardBloc(dashBoardDataRepository: DashBoardDataRepositoryImp()),),
      BlocProvider<AccountInfoEdit_Bloc>(create: (_)=>AccountInfoEdit_Bloc(accountInfoEditRepository: AccountInfoEditRepositoryImp()),),
      BlocProvider<ProductDetailsBloc>(create: (_)=>ProductDetailsBloc(productDetailsRepository: ProductDetailsRepositoryImp()),),
      BlocProvider<CategoryListBloc>(create: (_)=>CategoryListBloc(categoryDataListRepository: ImpCategoryDataListRepository()),)
    ],
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

          appBarTheme: AppBarTheme(
            color: Colors.white,
          )),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
      /*Home()*/,

    );
  }
}


//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'E-Commerce',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}

/*class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimatedSplash();
}

class AnimatedSplash extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _visible = true;
  double _scale;
  AnimationController _controller;
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  AnimatedSplash() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _logoStyle = FlutterLogoStyle.horizontal;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Animated Splash by ',
              style: TextStyle(color: Colors.white, fontSize: 20),
              children: <TextSpan>[
                TextSpan(
                  text: 'Med Redha',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.red, Colors.blue])),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: new EdgeInsets.only(bottom: 15.0),
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    child: new FlutterLogo(
                      size: 300.0,
                      style: _logoStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: GestureDetector(
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  child: Transform.scale(
                    scale: _scale,
                    child: _animatedButtonUI,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
    margin: new EdgeInsets.only(top: 15.0),
    height: 50,
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Colors.blue,
      boxShadow: [
        BoxShadow(
          color: Color(0x80000000),
          blurRadius: 30.0,
          offset: Offset(0.0, 5.0),
        ),
      ],
    ),
    child: Center(
      child: Text(
        'Hide/Show',
        style: TextStyle(fontSize: 15.0, color: Colors.white),
      ),
    ),
  );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
    setState(() {
      _visible = !_visible;
    });
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}*/




