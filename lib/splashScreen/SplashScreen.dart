
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ciblecommerce/HomeScreen/UiView/HomeScreen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StartState();
  }
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return initScreen(context);
  }

  var percent=0;
  @override
  void initState() {
    super.initState();
    startTimer();
    Timer timer;
    timer = Timer.periodic(Duration(milliseconds:70),(_){
      print('Percent Update');
      setState(() {
        percent+=1;
        if(percent >= 100){
          timer.cancel();
          // percent=0;
        }
      });
    });
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home()
    )
    );
  }

  Widget initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("assets/ic_icons/ecommerce.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "CIBL E-Commerce",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            /*CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )*/
            Visibility(child:Padding(
              padding: EdgeInsets.all(15),
              child:
              Container(
                height: 40,
                child: LiquidLinearProgressIndicator(
                  value: percent / 100,
                  valueColor: AlwaysStoppedAnimation(Colors.pink),
                  backgroundColor: Colors.white,
                  borderColor: Colors.white,
                  borderWidth: 5.0,
                  borderRadius: 12.0,
                  direction: Axis.horizontal,
                  center: Text(
                    percent.toString() + "%",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              )
              /* LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2800,
                animateFromLastPercent: true,
                percent: 0.9,
                center: Text("98.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.yellow,
                backgroundColor: Colors.white,
              )*/,
            ),visible: false,)

          ],
        ),
      ),
    );
  }
}