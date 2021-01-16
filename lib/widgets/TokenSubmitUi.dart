import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

class TokenSubmitUi extends StatelessWidget {
  String value;
  TextEditingController tokencontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            "Enter code that has been send to your phone by mail",textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple),
            maxLines: 3,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.12),
            child: TextField(
              controller: tokencontroller,
              maxLength: 6,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 39),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.red,
                  borderRadius: BorderRadius.circular(5)),
              child: FlatButton(
                child: Text(
                  "Continue",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
