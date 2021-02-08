import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularImageShow extends StatelessWidget {
  String imageurl;

  CircularImageShow({@required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: imageurl != null
          ?  CircleAvatar(
                  radius: 70,
                  backgroundColor: Color(0xffCACECE),
                  child: ClipOval(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Image.memory(base64Decode(imageurl),
                          fit: BoxFit.fill),
                    ),
                  ) /*AssetImage('assets/ic_icons/humanicon.png')*/,
                )

          : CircleAvatar(
              radius: 70,
              backgroundColor: Color(0xffCACECE),
              child: CircleAvatar(
                radius: 64,
                backgroundColor: Color(0xffCACECE),
                child: ClipOval(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: AssetImage('assets/ic_icons/humanicon.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ) /*AssetImage('assets/ic_icons/humanicon.png')*/,
            ),
    );
  }
}
