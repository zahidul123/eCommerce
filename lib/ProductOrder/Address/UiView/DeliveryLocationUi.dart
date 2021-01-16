import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryLocationUi extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return DeliveryLocation();
  }

}

class DeliveryLocation extends State<DeliveryLocationUi>{
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      body:Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.width * .05,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .03),
                    child: TextField(
                      controller: firstname,
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        labelText: "First Name",
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: CustomColors.BellYellow),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .03),
                    child: TextField(
                      controller: lastname,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        labelText: "Last Name",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: CustomColors.green),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * .03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .03),
            child: TextField(
                controller: phone,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  //Left Icon
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 0),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), //Add rounded corners
                  ),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * .03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .03),
            child: TextField(
                controller: email,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  //Left Icon
                  labelText: "Email Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), //Add rounded corners
                  ),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * .03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .03),
            child: TextField(
                controller: address,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  //Left Icon
                  labelText: "Address",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 0),
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), //Add rounded corners
                  ),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * .03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .03),
            child: Text(
              "Select Gender:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * .03,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .03),
                    child: TextField(
                      controller: city,
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        labelText: "City",
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: CustomColors.BellYellow),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .03),
                    child: TextField(
                      controller: zip,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        labelText: "Zip Code",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: CustomColors.green),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * .03,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .03),
                    child: TextField(
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        labelText: "District",
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: CustomColors.BellYellow),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .03),
                    child: TextField(
                      controller: country,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        isDense: true,
                        labelText: "Country",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: CustomColors.green),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * .03,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .03),
                child: ButtonTheme(
                  focusColor: Colors.red,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(5.0),
                    child: Text("Next", style: TextStyle(fontSize: 14)),
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}