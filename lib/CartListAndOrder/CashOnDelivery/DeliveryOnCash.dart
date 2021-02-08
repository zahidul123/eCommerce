import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashOnDelivery extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>OfflineDelivery();

}

class OfflineDelivery extends State<CashOnDelivery>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirm ',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:Column(
        children: [

        ],
      ),
    );
  }

}