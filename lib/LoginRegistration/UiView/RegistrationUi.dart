import 'dart:io';
import 'package:ciblecommerce/LoginRegistration/BlocStates/RegistrationBlocStatement/Registration_Bloc.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/RegistrationBlocStatement/Registration_Event.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/RegistrationBlocStatement/Registration_State.dart';
import 'package:ciblecommerce/LoginRegistration/UiView/LoginRegUI.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:device_info/device_info.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:flutter/material.dart';

class RegistrationUi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationUiDesign();
  }
}

class RegistrationUiDesign extends State<RegistrationUi> {
  final formkeyLog = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool passwordVisible;
  bool registrationUi, donotHaveAccText;
  bool focusable, blocvisibility,dialogvisibility;
  RegistrationBloc registrationBloc;
  @override
  void initState() {
    registrationBloc=BlocProvider.of<RegistrationBloc>(context);
    blocvisibility=false;
    dialogvisibility=true;
    passwordVisible = false;
    focusable = true;
    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    registrationBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: CustomColors.TextBlack),
          onPressed: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginRegUI())),
        ),
        title: Text(
          "Registration",
          style: TextStyle(color: CustomColors.jet_gray),
        ),
      ),
      body: ListView(
        children: <Widget>[
          /* Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Icon(
                    Icons.cancel,
                  ),
                ),
              ],
            ),
          ),*/
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 140,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/ic_icons/ciblLogo.png"),
                          fit: BoxFit.contain)),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .06,
          ),
          Center(
            child: Form(
              key: formkeyLog,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .08),
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
                          fillColor: Colors.black12,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          //Left Icon
                          hintText: "abc@gmail.com",
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black12, width: 0),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), //Add rounded corners
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .08),
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
                          fillColor: Colors.black12,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                                focusable = !focusable;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black12, width: 0),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), //Add rounded corners
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .08),
                    child: TextFormField(
                        textAlign: TextAlign.left,
                        obscureText: focusable,
                        controller: confirmPassController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Confirm Password is not empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          isDense: true,
                          fillColor: Colors.black12,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                                focusable = !focusable;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black12, width: 0),
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), //Add rounded corners
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .08),
                    child: ButtonTheme(
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width * .83,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            side: BorderSide(color: Colors.red)),
                        onPressed: () {
                          //this is only for login
                          if (formkeyLog.currentState.validate()) {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              blocvisibility = true;
                            });
                            if (passwordController.text == confirmPassController.text) {
                              setState(() {
                                FocusScope.of(context).unfocus();
                                blocvisibility=true;
                                dialogvisibility=true;
                              });
                              registrationBloc.add(FetchRegistrationEvent(email: emailController.text,password: passwordController.text));
                            } else {
                              setState(() {
                                dialogvisibility=false;
                              });
                              Alert(
                                context: context,
                                type: AlertType.error,
                                title: "Password Missmatch",
                                desc: "Confirm and valid password should same",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    width: 120,
                                  )
                                ],
                              ).show();
                            }
                          }
                        },
                        textColor: Colors.white,
                        padding: EdgeInsets.all(5.0),
                        child: Text("Registration",
                            style: TextStyle(fontSize: 14)),
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
              child: BlocBuilder<RegistrationBloc,RegistrationState>(
                builder:(context,state){
                  if(state is RegistrationInitialState){
                    return buildLoading();
                  }else if(state is RegistrationLoadingState){
                    return buildLoading();
                  }else if(state is RegistrationLoadedState){
                    String response=state.response;
                    Configuration alertdialog=Configuration();
                    if(response=="true"){

                      //registrationBloc.close();
                      WidgetsBinding.instance.addPostFrameCallback((_){
                        registrationBloc.add(InitialEvent());

                        alertdialog.successSweetAlert(context, "Your Registration Successfully complete ", "success", () => LoginRegUI());
                      });
                    }else{
                      registrationBloc.add(InitialEvent());
                      WidgetsBinding.instance.addPostFrameCallback((_){
                        alertdialog.loginFailedAlert(context, "Registration Failed", () => RegistrationUi());
                        /* SweetAlert.show(context,
                            subtitle: "Login Filed",
                            style: SweetAlertStyle.error,
                            showCancelButton: false,
                            onPress: (bool isConfirm) {
                              loginbloc.add(InitialEvent());
                              if(isConfirm){
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    LoginRegUI()), (Route<dynamic> route) => false);
                                //Navigator.of(context).pop();
                              }
                              return false;
                            });*/

                      });

                    }
                    return Container();
                  }else{
                    return buildLoading();
                  }
                },

              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .17,
          ),
        ],
      ),
    );
  }

  Widget buildLoading({bool frominit = true}) {
    return frominit
        ? Center(
            child: Visibility(
              visible: dialogvisibility,
              child: CircularProgressIndicator(),
            ),
          )
        : Container();
  }

}
