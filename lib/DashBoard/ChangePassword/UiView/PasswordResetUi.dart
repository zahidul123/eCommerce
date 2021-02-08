import 'dart:convert';

import 'package:ciblecommerce/DashBoard/ChangePassword/UiView/ChangePasswordUi.dart';
import 'package:ciblecommerce/LoginRegistration/UiView/LoginRegUI.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:ciblecommerce/utils/UserLogincheck.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordResetUi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResetUi();
}

class ResetUi extends State<PasswordResetUi> {
  bool otpOrEmailUi = true,loadingIndicator=false;
  var emailGlobalKey = GlobalKey<FormState>();
  var otpGlobalKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var otpController = TextEditingController();
  var responseOtp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otpOrEmailUi = true;
    loadingIndicator=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Edit Account Information",
            style: TextStyle(color: CustomColors.TextGrey),
          ),
        ),
        body: loadingIndicator?Center(
          child: Container(
            child: buildLoading(),
          ),
        ):
        Container(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1)),
              Visibility(
                  visible: otpOrEmailUi,
                  child: Container(
                height: 100,
                width: 140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ic_icons/ciblLogo.png"),
                        fit: BoxFit.contain)),
              )),
              showEmailUi(),
              showOptUi(),
            ],
          ),
        ));
  }

  showEmailUi() {
    return Visibility(
        visible: otpOrEmailUi,
        child: Container(
            child: Column(
          children: [
            Center(
              child: Form(
                key: emailGlobalKey,
                child: Column(
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
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .08),
                      child: ButtonTheme(
                        height: 50,
                        minWidth: MediaQuery.of(context).size.width * .82,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              side: BorderSide(color: Colors.red)),
                          onPressed: () {
                            if (emailGlobalKey.currentState.validate()) {
                              setState(() {
                                loadingIndicator=true;
                              });
                              sentOptCode("email", emailController.text);
                            }
                          },
                          textColor: Colors.white,
                          padding: EdgeInsets.all(5.0),
                          child: Text("Send", style: TextStyle(fontSize: 14)),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }

  showOptUi() {
    return Visibility(
        visible: !otpOrEmailUi,
        child: Container(
            child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.1)),
             Center(
              child: Form(
                key: otpGlobalKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .1),
                    ),
                    Container(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          child: Padding(
                            padding: EdgeInsets.all(MediaQuery.of(context).size.width*.06),
                            child: Text(
                              "ONE TIME OTP",
                              style: TextStyle(
                                  color: CustomColors.optimal_black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .08),
                      child: TextFormField(
                          textAlign: TextAlign.left,
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty && value.length <= 5) {
                              return "Enter Correct Otp";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: Colors.black12,
                            prefixIcon: Icon(
                              Icons.adjust,
                              color: Colors.grey,
                            ),
                            //Left Icon
                            hintText: "12345",
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
                        minWidth: MediaQuery.of(context).size.width * .82,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              side: BorderSide(color: Colors.red)),
                          onPressed: () {
                            if (otpGlobalKey.currentState.validate()) {
                              setState(() {
                                loadingIndicator=true;
                              });
                              sentOptCode("otp", otpController.text);
                            }
                          },
                          textColor: Colors.white,
                          padding: EdgeInsets.all(5.0),
                          child: Text("Send", style: TextStyle(fontSize: 14)),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }

  Widget buildLoading() {
    return Container(
      child: CircularProgressIndicator(),
    );
  }

  sentOptCode(String channel, String email) async {
    var body = Map<String, dynamic>();
    var hitUrl;
    if (channel == "email") {
      body["email"] = email;
      hitUrl = Configuration.BASE_URL + "api/customers/reset_password";
    } else {
      body["code"] = email;
      hitUrl =
          Configuration.BASE_URL + "api/customers/reset_password_confirmation";
    }
    try {
      final response = await http.post(hitUrl, body: body);
      setState(() {
        loadingIndicator=false;
      });
      if (response.statusCode == 200) {
        var responseDecode = json.decode(response.body);
        String success = responseDecode["success"].toString();
        String message = responseDecode["msg"];
        if (success == "true") {
          if (channel == "email") {
            setState(() {
              otpOrEmailUi = false;
            });
          } else {
            LoginCheck.Logout();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginRegUI()), (route) => false);
          }
         /*   Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ChangePasswordUi()));*/
        } else {

          Configuration configuration = Configuration();
          configuration.failedAlertDialog(
              context, message != null ? message : "Failed to reset password");
          setState(() {
            otpOrEmailUi=true;
          });
        }
      } else {
        throw Exception();
      }
    } catch (e) {}
  }
}
