import 'package:ciblecommerce/DashBoard/ChangePassword/BlocStates/ChangePassword_Bloc.dart';
import 'package:ciblecommerce/DashBoard/ChangePassword/BlocStates/ChangePassword_Event.dart';
import 'package:ciblecommerce/DashBoard/ChangePassword/BlocStates/ChangePassword_State.dart';
import 'package:ciblecommerce/DashBoard/DashBoardUiView/UiView/DashBoardUiView.dart';
import 'package:ciblecommerce/LoginRegistration/UiView/LoginRegUI.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordUi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChangePassword();
  }
}

class ChangePassword extends State<ChangePasswordUi> {

  final formkeyLog = GlobalKey<FormState>();
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String user_id;
  bool passwordVisible;
  bool blocvisibility,dialogvisibility;
  bool focusable;
  ChangePasswordBloc changePasswordBloc;
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    // TODO: implement initState
    changePasswordBloc = BlocProvider.of<ChangePasswordBloc>(context);
    shahredpreferenceinitial();
    dialogvisibility=true;
    passwordVisible = false;
    focusable=true;
    blocvisibility=false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: CustomColors.TextGrey),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard())),
        ),
        title: Text(
          "Password Change",
          style: TextStyle(color: CustomColors.TextGrey),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 140,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/ic_icons/resetpassword.png"),
                          fit: BoxFit.contain)),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Form(
            key: formkeyLog,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .08),
                  child: Text(
                    "Current Password",
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .08),
                  child: TextFormField(
                      controller: oldpasswordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password should not empty";
                        } else if (value.length < 6) {
                          return "Password should not less then 6 digit";
                        }
                        return null;
                      },
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        fillColor: Colors.black12,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        //Left Icon
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12, width: 0),
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ), //Add rounded corners
                        ),
                      )
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .08),
                  child: Text("New Password"),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .08),
                  child: TextFormField(
                      controller: newpasswordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password should not empty";
                        } else if (value.length < 6) {
                          return "Password should not less then 6 digit";
                        }
                        return null;
                      },
                      textAlign: TextAlign.left,
                      obscureText: focusable,
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
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .08),
                  child: Text("Confirm Password"),
                ),
                SizedBox(
                  height: 5,
                ),
                Visibility(
                  visible: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .08),
                    child: TextFormField(
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password should not empty";
                          } else if (value.length < 6) {
                            return "Password should not less then 6 digit";
                          }
                          return null;
                        },
                        textAlign: TextAlign.left,
                        obscureText: focusable,
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
                        if (formkeyLog.currentState.validate()) {
                          setState(() {
                            FocusScope.of(context).unfocus();
                          });
                          if (newpasswordController.text == confirmPasswordController.text) {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              blocvisibility=true;
                              dialogvisibility=true;
                            });
                             changePasswordBloc.add(FetchChangePasswordEvent(
                              user_id: user_id,oldpassword: oldpasswordController.text,newpassword: newpasswordController.text,
                              confirmpassword: confirmPasswordController.text
                            ));

                          }
                          else {
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
                      child: Text("Submit", style: TextStyle(fontSize: 14)),
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: blocvisibility,
            child: Container(
              child: BlocBuilder<ChangePasswordBloc,ChangePasswordState>(
                builder:(context,state){
                  if(state is ChangePasswordInitialState){
                    return buildLoading();
                  }else if(state is ChangePasswordLoadingState){
                    return buildLoading();
                  }else if(state is ChangePasswordLoadedState){
                    var response=state.response;
                    Configuration alertdialog=Configuration();
                    if(response[0]=="true"){
                      WidgetsBinding.instance.addPostFrameCallback((_){
                        changePasswordBloc.add(InitialEvent());
                        alertdialog.successSweetAlert(context, response[1].toString(), "success", () => LoginRegUI());
                      });
                    }else{
                      WidgetsBinding.instance.addPostFrameCallback((_){
                        changePasswordBloc.add(InitialEvent());
                        alertdialog.loginFailedAlert(context, response[1].toString(), () => ChangePasswordUi());
                      });
                    }
                    return Container();
                  }else if(state is RefressState){
                    return Container();
                  } else{
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
  Future  shahredpreferenceinitial() async{
    sharedPreferences=await SharedPreferences.getInstance();
    setState(() {
      user_id=sharedPreferences.getString("user_id");
    });
  }
}
