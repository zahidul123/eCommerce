import 'package:bloc/bloc.dart';
import 'package:ciblecommerce/DashBoard/ChangePassword/UiView/PasswordResetUi.dart';
import 'package:ciblecommerce/ForgotPassword/UiView/ForgotPasswordUi.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/LoginBlocState/Login_Bloc.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/LoginBlocState/Login_Event.dart';
import 'package:ciblecommerce/LoginRegistration/BlocStates/LoginBlocState/Login_state.dart';
import 'package:ciblecommerce/LoginRegistration/UiView/RegistrationUi.dart';
import 'package:ciblecommerce/utils/Configuration.dart';
import 'package:ciblecommerce/HomeScreen/UiView/HomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginRegUI extends StatefulWidget{

  const LoginRegUI({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return CompleteUiDesign();
  }
}

class CompleteUiDesign extends State<LoginRegUI>{
  final formkeyLog=GlobalKey<FormState>();
  final formkeyReg=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();
  bool passwordVisible;
  bool registrationUi,donotHaveAccText;
  bool focusable,blocvisibility;
  LoginBloc loginbloc;
  @override
  void initState() {
    // TODO: implement initState
    loginbloc=BlocProvider.of<LoginBloc>(context);
    blocvisibility=false;
    donotHaveAccText=true;
    passwordVisible=false;
    focusable=true;
    registrationUi=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 15),
               child:InkWell(
                 child: Icon(Icons.cancel,),
                 onTap: ()=>Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(
                     builder: (context) => Home()), (route) => false),
               )),
            ],
          ) ,),
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
           child:Column(children: <Widget>[
             Container(
               height: 100,
               width: 140,
               decoration: BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage("assets/ic_icons/ciblLogo.png"),
                       fit: BoxFit.contain)),
             )
          ],),),
          SizedBox(height: MediaQuery.of(context).size.height*.06,),
          Center(
            child: Form(
              key: formkeyLog,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.08),
                      child: TextFormField(
                          textAlign: TextAlign.left,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if(value.isEmpty){
                              return "Email should not empty";
                            }else if(!regex.hasMatch(value)){
                              return 'Enter Valid Email';
                            }
                              return null;

                          },
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: Colors.black12,
                            prefixIcon: Icon(Icons.email,color: Colors.grey,),//Left Icon
                            hintText: "abc@gmail.com",
                            border: OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.black12,width: 0),
                          borderRadius: BorderRadius.circular(10.0,),//Add rounded corners
                        ),
                          )
                      ),),
                  SizedBox(height: 10,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.08),
                    child: TextFormField(
                        textAlign: TextAlign.left,
                        obscureText: focusable,
                        controller: passwordController,
                        validator: (value){
                          if(value.isEmpty){
                            return "Password should not empty";
                          }else if(value.length<6){
                            return "Password should not less then 6 digit";
                          }
                            return null;

                        },
                        decoration: InputDecoration(
                          filled: true,
                          isDense: true,
                          fillColor: Colors.black12,
                          prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                          suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            onPressed: (){
                                setState(() {
                                  passwordVisible=!passwordVisible;
                                  focusable=!focusable;
                                });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.black12,width: 0),
                            borderRadius: BorderRadius.circular(10.0,),//Add rounded corners
                          ),
                        )
                    ),),

                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PasswordResetUi()));
                    },
                    child:Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*.08),
                      child: Text("Forgot your password?",textAlign: TextAlign.right,style:TextStyle(fontSize: 14,color: Colors.green)),) ,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  Padding(padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.08) ,
                    child: ButtonTheme(
                      height: 50,
                      minWidth:MediaQuery.of(context).size.width*.82 ,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            side: BorderSide(color: Colors.red)),
                        onPressed: () {
                          if(!registrationUi){
                            //this is only for login
                            if(formkeyLog.currentState.validate()){
                              setState(() {
                                FocusScope.of(context).unfocus();
                                blocvisibility=true;
                              });

                                loginbloc.add(FetchLoginEvent(email: emailController.text,password: passwordController.text));

                            }
                          }else{
                            // this block is use for registration
                            if(emailController.text!=""&&passwordController.text!=""&&confirmPassController!=""){
                            }
                          }
                        },
                        textColor: Colors.white,
                        padding: EdgeInsets.all(5.0),
                        child: Text("Login",style:TextStyle(fontSize: 14)),
                        color: Colors.red,
                      ),
                    ),),
                ],
              ),
            ),
          ),
          Visibility(
            visible: blocvisibility,
            child: Container(
              child: BlocBuilder<LoginBloc,LoginState>(
                builder:(context,state){
                  if(state is LoginInitialState){
                    return buildLoading();
                  }else if(state is LoginLoadingState){
                    return buildLoading();
                  }else if(state is LoginLoadedState){
                    String response=state.response;
                    Configuration alertdialog=Configuration();
                    if(response=="true"){
                      loginbloc.add(InitialEvent());

                      WidgetsBinding.instance.addPostFrameCallback((_){
                       /* SweetAlert.show(context,
                            subtitle: "Your Login Success",
                            style: SweetAlertStyle.success,
                            showCancelButton: false, onPress: (bool isConfirm) {

                              if(isConfirm){
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) => Home()
                                )
                                );
                              }
                              return false;
                            });*/
                        alertdialog.successSweetAlert(context, "Your login Success", "success", () => Home());
                      });
                    }else{
                      WidgetsBinding.instance.addPostFrameCallback((_){
                        loginbloc.add(InitialEvent());
                        alertdialog.loginFailedAlert(context, "Login Failed", () => LoginRegUI());
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
                  }else if(state is RefressState){
                    return buildLoading(frominit: false);
                  }else{
                    return buildLoading();
                  }
                },

              ),
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height*.17,),
           Center(child:Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child:Text("Do not have an account?",textAlign: TextAlign.right,) ,
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {

                     Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationUi()));

                    },
                    child:Padding(padding: EdgeInsets.only(left: 0.9),
                      child: Text("Sign Up",textAlign: TextAlign.left,style:TextStyle(fontSize: 14,color: Colors.green)),) ,
                  ),
                )
              ],
            )
          )



        ],),
    );
  }
  Widget buildLoading({bool frominit=true})
  {
    return frominit?Center(
      child: CircularProgressIndicator(),
    ):Container();
  }






}