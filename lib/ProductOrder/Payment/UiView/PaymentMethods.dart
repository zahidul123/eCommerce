import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return PaymentMethodUi();
  }
}

class PaymentMethodUi extends State<PaymentMethod>{
  List imagelist=[
    "assets/ic_icons/paypal.png",
    "assets/ic_icons/bkash.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Payment Methods',
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: <Widget>[
          Container(
            child: CarouselSlider(
                items: imagelist.map((images) {
                  return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height:
                          MediaQuery.of(context).size.height *
                              0.30,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: Colors.blueAccent,
                            child: Image.network(
                              images,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      });
                }).toList(),
                options: CarouselOptions(
                  height: 120,
                  aspectRatio: 16 / 3,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration:
                  Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )
            ),
            
          ),
        ],
      ),

    );
  }

}