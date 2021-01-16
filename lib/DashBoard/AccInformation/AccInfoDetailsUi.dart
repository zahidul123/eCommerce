
import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoDataShahredPreference.dart';
import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoEdit/UiView/AccountInfoEditUiView.dart';
import 'package:ciblecommerce/DashBoard/DashBoardUiView/UiView/DashBoardUiView.dart';
import 'package:ciblecommerce/LoginRegistration/LoginModelClass.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountInfoDetails extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color:Colors.black),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashBoard())),
        ),
        title: Text("Account Information",style: TextStyle(color:CustomColors.TextGrey),

        ),
      ),
      body: FutureBuilder(
        future: AccountInfoPreference.checkUserLogin(),
        builder:(context,AsyncSnapshot<List<LoginModel>>snapshot){
          List<LoginModel> loginModelsnap=snapshot.data;
          LoginModel loginModel=loginModelsnap[0];
          return Container(

            child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
              child: ListView(
                children: <Widget>[
                  Card(
                    elevation: 5,
                    child: Column(
                      children: <Widget>[

                        Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Personal Information",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>AccountInfoEditUi()));
                                },
                                child:Icon(Icons.edit,),
                                focusColor:CustomColors.TextGrey,
                              )
                            ],
                          ),),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Name"),
                          subtitle: Text(loginModel.user_name),
                        ),
                        ListTile(
                          leading: Icon(Icons.data_usage),
                          title: Text("Gender"),
                          subtitle: Text(loginModel.gender!=null?loginModel.gender:"N/A"),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2,),
                  Card(
                    elevation: 5,
                    child: Column(
                      children: <Widget>[

                        Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Contact Information",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              InkWell(
                                onTap: (){

                                },
                                child:Icon(Icons.edit,),
                                focusColor:CustomColors.TextGrey,
                              )
                            ],
                          ),),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text("Phone"),
                          subtitle: Text(loginModel.phone!=null?loginModel.phone:"N/A"),
                        ),
                        ListTile(
                          leading: Icon(Icons.mail_outline),
                          title: Text("Email"),
                          subtitle: Text(loginModel.email!=null?loginModel.email:"N/A"),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2,),
                  Card(
                    elevation: 5,
                    child: Column(
                      children: <Widget>[

                        Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Address Information",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              InkWell(
                                onTap: (){

                                },
                                child:Icon(Icons.edit,),
                                focusColor:CustomColors.TextGrey,
                              )
                            ],
                          ),),
                        ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text("Address"),
                          subtitle: Text(loginModel.address!=null?loginModel.address:"N/A"),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },

      ),
    );
  }


}