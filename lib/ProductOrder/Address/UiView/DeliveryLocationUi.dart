import 'package:ciblecommerce/CartListAndOrder/AddToCart/DatabaseHelperclass.dart';
import 'package:ciblecommerce/DashBoard/AccInformation/AccountInfoDataShahredPreference.dart';
import 'package:ciblecommerce/LoginRegistration/LoginModelClass.dart';
import 'package:ciblecommerce/ProductOrder/Payment/UiView/PaymentMethods.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryLocationUi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DeliveryLocation();
  }
}

class DeliveryLocation extends State<DeliveryLocationUi> {

  final validation = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool checkboxvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Billing address',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:Container(
        child: Form(
          key: validation,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.width * .05,
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Shipping Address:",
                        style:
                        TextStyle(fontSize: 16, color: CustomColors.TextBlack),
                      ),
                    ),
                    Expanded(
                        child: CheckboxListTile(
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text("Same as billing address"),
                            value: checkboxvalue,
                            onChanged: (value) {
                              setState(() {
                                checkboxvalue = value;
                              });
                              getUserAllInformation();
                            }))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .03),
                        child: TextFormField(
                          controller: firstname,
                          style: TextStyle(fontSize: 14),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if(value.length<4){
                              return "Enter Valid name";
                            }
                            return null;
                          },
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
                        child: TextFormField(
                          controller: lastname,
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 14),
                          validator: (value) {
                            if(value.length<4){
                              return "Enter Valid name";
                            }
                            return null;
                          },
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
                child: TextFormField(
                    maxLength: 11,
                    controller: phone,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 14),
                    validator: (value) {
                      if(value.length<11){
                        return "Enter Valid phone number";
                      }
                      return null;
                    },
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
                child: TextFormField(
                    controller: email,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      Pattern pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                      if (value.isEmpty) {
                        return "Email should not empty";
                      } else if (!regex.hasMatch(value)) {
                        return 'Enter Valid Email';
                      }
                      return null;
                    },
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
                child: TextFormField(
                    controller: address,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14),
                    validator: (value) {
                      if(value.length<5){
                        return "Enter Valid Address";
                      }
                      return null;
                    },
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
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .03),
                        child: TextFormField(
                          controller: city,
                          style: TextStyle(fontSize: 14),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if(value.length<5){
                              return "Enter Valid Address";
                            }
                            return null;
                          },
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
                          keyboardType: TextInputType.phone,
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

              GestureDetector(
                onTap:(){

                  if(validation.currentState.validate()){
                    Navigator.push(context,
                        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) =>
                            PaymentMethod(firstname.text,lastname.text,phone.text,email.text,address.text,city.text),
                          transitionDuration: Duration(seconds: 1),
                        ));
                  }

                },
                child:Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .03),
                  child: Container(
                      decoration:BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                              Radius.circular(4)),
                      ),
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.28),
                      height: 50,
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      )),
                ) ,),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }

  void getUserAllInformation() async {
    Future<List<LoginModel>> loginModelsnap =
        AccountInfoPreference.checkUserLogin();
    LoginModel loginModel = await loginModelsnap.then((value) => value[0]);
    if (checkboxvalue == true) {
      firstname.text = loginModel.first_name;
      lastname.text = loginModel.last_name;
      email.text = loginModel.email;
      address.text = loginModel.address;
      city.text = loginModel.city;
      phone.text = loginModel.phone;
    } else {
      firstname.text = "";
      lastname.text = "";
      email.text = "";
      address.text = "";
      city.text = "";
      phone.text = "";
    }
  }
}
