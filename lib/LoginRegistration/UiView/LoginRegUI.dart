import 'package:bloc/bloc.dart';
import 'package:ciblecommerce/DashBoard/ChangePassword/UiView/PasswordResetUi.dart';
import 'package:ciblecommerce/ForgotPassword/UiView/ForgotPasswordUi.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/LoginBlocState/Login_Bloc.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/LoginBlocState/Login_Event.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/LoginBlocState/Login_state.dart';
import 'package:ciblecommerce/LoginRegistration/UiView/RegistrationUi.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:ciblecommerce/HomeScreen/UiView/HomeScreen.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginRegUI extends StatefulWidget {
  const LoginRegUI({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return CompleteUiDesign();
  }
}

class CompleteUiDesign extends State<LoginRegUI> {
  final formkeyLog = GlobalKey<FormState>();
  final formkeyReg = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool passwordVisible;
  bool registrationUi, donotHaveAccText;
  bool focusable, blocvisibility;
  LoginBloc loginbloc;

  @override
  void initState() {
    // TODO: implement initState
    loginbloc = BlocProvider.of<LoginBloc>(context);
    blocvisibility = false;
    donotHaveAccText = true;
    passwordVisible = false;
    focusable = true;
    registrationUi = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: CustomColors.red,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 15, left: 15),
                      child: InkWell(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onTap: () => Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Home()),
                            (route) => false),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "E-Commerce",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationUi()));
                  },
                  child: Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        "Registration",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Welcom",
                style:
                    TextStyle(fontSize: 18, color: CustomColors.silver_White),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      height: 5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                ],
              )),
            ),
            SizedBox(
              height: 10,
            ),
            /* Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
             child:Column(children: <Widget>[
               Container(
                 height: 100,
                 width: 140,
                 decoration: BoxDecoration(
                     image: DecorationImage(
                         image: AssetImage("assets/ic_icons/ciblLogo.png"),
                         fit: BoxFit.contain)),
               )
            ],),)*/

            Flexible(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "Please Enter Your Credentials To Proceed",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.jet_gray),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Form(
                          key: formkeyLog,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: TextFormField(
                                    textAlign: TextAlign.left,
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (value.isEmpty) {
                                        return "Email should not empty";
                                      } else if (!regex.hasMatch(value)) {
                                        return 'Enter Valid Email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        isDense: true,
                                        fillColor: Colors.white,
                                        /*  prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.grey,
                                      ),*/
                                        //Left Icon
                                        labelText: "Email",
                                        hintText: "abc@gmail.com",
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black87),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()
                                        /*border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 0),
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ), //Add rounded corners
                                      ),*/
                                        )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: TextFormField(
                                    textAlign: TextAlign.left,
                                    obscureText: focusable,
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Password should not empty";
                                      } else if (value.length < 6) {
                                        return "Password should not less then 6 digit";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        isDense: true,
                                        fillColor: Colors.white,
                                        /*prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      ),*/
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              passwordVisible = !passwordVisible;
                                              focusable = !focusable;
                                            });
                                          },
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black87),
                                          //  when the TextFormField in unfocused
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                          //  when the TextFormField in focused
                                        ),
                                        border: UnderlineInputBorder()
                                        /*border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 0),
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ), //Add rounded corners
                                      ),*/
                                        )),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .03,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PasswordResetUi()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          .08),
                                  child: Text("Forgot your password?",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.green)),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .03,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width * .25),
                                child: ButtonTheme(
                                  height: 50,
                                  minWidth:
                                      MediaQuery.of(context).size.width * .82,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.0),
                                        side: BorderSide(color: Colors.red)),
                                    onPressed: () {
                                      if (!registrationUi) {
                                        //this is only for login
                                        if (formkeyLog.currentState.validate()) {
                                          setState(() {
                                            FocusScope.of(context).unfocus();
                                            blocvisibility = true;
                                          });

                                          loginbloc.add(FetchLoginEvent(
                                              email: emailController.text,
                                              password: passwordController.text));
                                        }
                                      } else {
                                        // this block is use for registration
                                        if (emailController.text != "" &&
                                            passwordController.text != "" &&
                                            confirmPassController != "") {}
                                      }
                                    },
                                    textColor: Colors.white,
                                    padding: EdgeInsets.all(5.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Next",
                                              style: TextStyle(fontSize: 20)),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_outlined,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: blocvisibility,
                        child: Container(
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginInitialState) {
                                return buildLoading();
                              } else if (state is LoginLoadingState) {
                                return buildLoading();
                              } else if (state is LoginLoadedState) {
                                String response = state.response;
                                Configuration alertdialog = Configuration();
                                if (response == "true") {
                                  loginbloc.add(InitialEvent());

                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    alertdialog.successSweetAlert(
                                        context,
                                        "Your login Success",
                                        "success",
                                        () => Home());
                                  });
                                } else {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    loginbloc.add(InitialEvent());
                                    alertdialog.loginFailedAlert(context,
                                        "Login Failed", () => LoginRegUI());
                                  });
                                }
                                return Container();
                              } else if (state is RefressState) {
                                return buildLoading(frominit: false);
                              } else {
                                return buildLoading();
                              }
                            },
                          ),
                        ),
                      ),
                      /* SizedBox(
                        height: MediaQuery.of(context).size.height * .17,
                      ),
                      Center(
                          child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Text(
                              "Do not have an account?",
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegistrationUi()));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 0.9),
                                child: Text("Sign Up",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.green)),
                              ),
                            ),
                          )
                        ],
                      ))*/
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoading({bool frominit = true}) {
    return frominit
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container();
  }
}
