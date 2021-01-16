import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AccountInfoEditEvent extends Equatable {}

class FetchAccountInfoEditEvent extends AccountInfoEditEvent {
  String user_id;
  String first_name;
  String last_name;
  String phone;
  String gender;
  String picture;
  String address;
  String city;
  String zip;
  String email;
  String country;


  FetchAccountInfoEditEvent(
  {@required this.user_id,
    @required this.first_name,
    @required this.last_name,
    @required this.phone,
    @required this.gender,
    @required this.picture,
    @required this.address,
    @required this.city,
    @required  this.zip,
    @required this.email,
    @required  this.country

});

  @override
  // TODO: implement props
  List<Object> get props => [user_id,first_name,last_name,phone,gender,picture,address,city,zip,email,country];
}
