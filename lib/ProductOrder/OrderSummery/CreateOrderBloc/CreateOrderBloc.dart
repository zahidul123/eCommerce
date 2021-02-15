
import 'package:ciblecommerce/CartListAndOrder/CartListUi/OrderListModel.dart';
import 'package:ciblecommerce/ProductOrder/OrderSummery/OrderListRepository/CreateOrderRepository.dart';
import 'package:rxdart/rxdart.dart';
class CreateOrderBloc {

  final BehaviorSubject <List<Object>>createdOrderSubject = BehaviorSubject<
      List<Object>>();
  final orderRepository = OrderRepository();
  getOrderRepositoryResponse(String firstName, String lastName, String phone,
      String email, String address,
      String city,String zip,String country, String deleveryType, double prices,
      List<OrderListModel> orderListArray) async {
    final response = await orderRepository.fetchOrderList(billing_firstName: firstName, billing_lastName: lastName, billing_phone: phone,
        billing_email: email, billing_city: city, billing_country:country, billing_zip: zip,
        billing_address: address,orderListArray: orderListArray);
    createdOrderSubject.sink.add(response);
  }

  void drainStream() {
    createdOrderSubject.value = null;
  }

  void dispose() async {
    await createdOrderSubject.drain();
    createdOrderSubject.close();
  }
   BehaviorSubject <List<Object>> get getOrderSubject => createdOrderSubject;
}

final confirmOrderBloc = CreateOrderBloc();