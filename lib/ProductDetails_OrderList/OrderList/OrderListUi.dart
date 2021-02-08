import 'package:ciblecommerce/ProductDetails_OrderList/OrderList/Data/OrderListModelClass.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/OrderList/OrdderBloc/OrderBlocClass.dart';
import 'package:ciblecommerce/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderlistUi extends StatelessWidget {
  String user_id;

  OrderlistUi(this.user_id);

  @override
  Widget build(BuildContext context) {
    orderDetailsBlocList..getOrderList(user_id);
    return Scaffold(
      appBar: AppBar(
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
      body: Builder(
        builder: (context) {
          return Container(
            child: StreamBuilder(
              stream: orderDetailsBlocList.subject.stream,
              builder: (context, AsyncSnapshot<List<MyList>> snapShot) {
                {
                  if (!snapShot.toString().isEmpty) {
                    /*if (snapShot.toString() != null &&
                        snapShot.toString().length < 1) {
                      return _buildErrorWidget("No Order Data Found");
                    }*/
                    List<MyList> response = snapShot.data;
                    if(response.isEmpty){
                      return _buildErrorWidget("No Order Data Found");
                    }else{
                      return _buildOrderWidget(response);
                    }
                  }
                  else {
                    return _buildLoadingWidget();
                  }
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: CircularProgressIndicator(),
        )
      ],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  @override
  void dispose() {
    orderDetailsBlocList..drainStream();
  }

  Widget _buildOrderWidget(List<MyList> snapShot) {
    var myorderList = snapShot;
    return ListView.builder(
      itemCount: myorderList.length,
      itemBuilder: (context, value) {
        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 5,
              ),
              Text(
                "Order Date :" + myorderList[value].invoiceDate,
                style: TextStyle(color: CustomColors.gunmetal_black),
              ),
              Row(
                children: [
                  Flexible(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/ic_icons/lather.jpg',
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.contain,
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      flex: 6,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Order Id: " + myorderList[value].orderId),
                              Text("\$ " + myorderList[value].orderTotal),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Order Type: " +
                                  myorderList[value].orderType),
                              Text("Total Item" + myorderList[value].totalItem),
                            ],
                          ),
                          Center(
                            child: Text(
                                "Phone: ${myorderList[value].billingPhone}"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text("Address: " +
                                      myorderList[value].shippingAddress)),
                              Text("Zip :" + myorderList[value].shippingZip),
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 2,
                      child: GestureDetector(
                        child: Center(
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                    child: Text(
                                  myorderList[value].status,
                                  style: TextStyle(
                                    backgroundColor: CustomColors.PurpleIcon,
                                    color: Colors.white,
                                  ),
                                )),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
