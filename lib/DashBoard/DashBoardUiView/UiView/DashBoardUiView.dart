import 'package:ciblecommerce/DashBoard/ChangePassword/UiView/ChangePasswordUi.dart';
import 'package:ciblecommerce/DashBoard/DashBoardUiView/BlocStates/DashBoard_Event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ciblecommerce/DashBoard/AccInformation/AccInfoDetailsUi.dart';
import 'package:ciblecommerce/DashBoard/DashBoardUiView/BlocStates/DashBoard_Bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ciblecommerce/DashBoard/TransactionHistory/TransactionHistoryUi.dart';
import 'package:ciblecommerce/HomeScreen/UiView/HomeScreen.dart';
import 'package:ciblecommerce/utils/UserLogincheck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DashBoard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>DashBoardUiView();

}
class DashBoardUiView extends State<DashBoard>{
  Choice _selectedChoice = choices[0]; // The app's "state".
  SharedPreferences sharedPreferences;
  String user_name,phone,user_id;
  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
      String checkLlogin=_selectedChoice.title;
      if(checkLlogin=='Log Out') {
        LoginCheck.Logout();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
      }
    });
  }
    DashBoardBloc dashBoardBloc;
  @override
  void initState() {
    dashBoardBloc=BlocProvider.of<DashBoardBloc>(context);
    shahredpreferenceinitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home())),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text('Dashboard',style: TextStyle(color: Colors.black),),
          actions: <Widget>[
            // overflow menu
            PopupMenuButton<Choice>(
              offset: const Offset(0.0, 60.0),
              icon:Icon(Icons.more_vert, color: Colors.black),
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: ListTile(
                      leading: IconButton(
                        icon: Icon(choice.icon),
                        onPressed: () {
                        },
                      ),
                      title: Text(choice.title),
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),
               child:Container(
                 height: 70,
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      flex: 2,

                      child: CircleAvatar(
                        radius:60,
                        backgroundColor: Color(0xffCACECE),
                        child:ClipOval(
                          child:Padding(padding: EdgeInsets.all(12),child: Image(image:AssetImage('assets/ic_icons/humanicon.png'),fit: BoxFit.contain,),),
                        )/*AssetImage('assets/ic_icons/humanicon.png')*/,

                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Text(user_name!=null?user_name:"N/A",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          SizedBox(
                            width: 100,
                            height: 30,
                            child:Container(decoration: BoxDecoration(
                                color: Color(0xff244141),
                                borderRadius: BorderRadius.all( Radius.circular(10.0 ) )
                            ),
                              child:Center(child: Text(phone!=null?phone:"N/A",
                                textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),) ,
                            ) ,
                          )

                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(" "),
                    )
                  ],
                ),) ,),
              Container(height: 5,color: Colors.grey,),

              InkWell(
                child: Container(
                  child:ListTile(
                    leading: Icon(Icons.shop),
                    title: Text("My Order"),
                  ),
                  /*Padding(padding: EdgeInsets.only(left: 5,top: 5),child:
                   Row(

                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.shop),
                        onPressed: () => {},
                      ),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Padding(padding: EdgeInsets.only(top: 8),
                        child: Text("My Order",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),)

                    ],
                  ),),*/
                ),
              ),

              Container(height: 5,color: Colors.grey,),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text("Account Information"),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountInfoDetails()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment),
                title: Text("Transaction History"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TransactionHistoryUi()));
                }
               ,
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text("Terms & Conditions"),
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text("Password Change"),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ChangePasswordUi()));
                },
              ),

              Container(height: 5,color: Colors.grey,),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text("Address"),
              ),
            ],
          ),

        ),
      );
  }

Future  shahredpreferenceinitial() async{
    sharedPreferences=await SharedPreferences.getInstance();
    setState(() {
      user_name=sharedPreferences.getString("user_name");
      phone=sharedPreferences.getString("phone");
      user_id=sharedPreferences.getString("user_id");
    });
    if(user_id!=null){
      loadBlocData();
    }
}

  void loadBlocData() {
    if(user_id!=null){
      dashBoardBloc.add(FetchDashBoardEvent(user_id: user_id));
    }
  }



}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Log Out', icon: Icons.power_settings_new),
  /*const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),*/
];

