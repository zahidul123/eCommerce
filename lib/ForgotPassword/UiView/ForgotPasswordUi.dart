
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ForgotPasswordUi();
  }

}

class ForgotPasswordUi extends State<ForgotPassword>{
  final formkeyLog=GlobalKey<FormState>();
  final formkeyReg=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: CustomColors.TextGrey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Forgot Password",style: TextStyle(color:CustomColors.TextGrey),
        ),
      ),
      body: ListView(
        children: <Widget>[
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
          Container(
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


                  SizedBox(height: MediaQuery.of(context).size.height*.03,),
                  Padding(padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.077) ,
                    child: ButtonTheme(
                      height: 50,
                      minWidth:MediaQuery.of(context).size.width*.843 ,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            side: BorderSide(color: Colors.red)),
                        onPressed: () {

                        },
                        textColor: Colors.white,
                        padding: EdgeInsets.all(5.0),
                        child: Text("Reset Password",style:TextStyle(fontSize: 14)),
                        color: Colors.red,
                      ),
                    ),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}