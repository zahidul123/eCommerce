
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderlistUi extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'History of Order',
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text("You have no order yet",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color:CustomColors.TextGrey),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 2),)
        ],
      ),
    );
  }

}