
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionHistoryUi extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: CustomColors.TextGrey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Transaction History",style: TextStyle(color:CustomColors.TextGrey),

        ),
      ),
      body: Container(
        child:Align(alignment: Alignment.center,
         child: Text("No transaction history Found"),),
      ),
    );
  }

}