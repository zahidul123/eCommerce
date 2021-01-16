import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Configuration {
  static final String BASE_URL = "http://27.147.135.164/ecomm/";
  static final String BASE_URLSean = "http://27.147.135.164/ebook/api";

 Future<String> checkInternetconnection() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return "true";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return "true";
    }else{
      return "false";
    }
  }

  successSweetAlert(final BuildContext context, String message, title,
      Widget Function() createPage) {
    Alert(
      context: context,
      type: AlertType.success,
      title: message,
      buttons: [
        DialogButton(
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) {
              return createPage();
            }), (Route<dynamic> route) => false);;
          },
          width: 120,
        )
      ],
    ).show();
  }

  loginFailedAlert(final BuildContext context, String message,
      Widget Function() createPage) {
    Alert(
      context: context,
      type: AlertType.error,
      title: message,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) {
                  return createPage();
                }), (Route<dynamic> route) => false);
          },
          width: 120,
        )
      ],
    ).show();
  }
}
