import 'package:ciblecommerce/ProductDetails_OrderList/OrderList/Data/OrderDataRepository.dart';
import 'package:ciblecommerce/ProductDetails_OrderList/OrderList/Data/OrderListModelClass.dart';
import 'package:rxdart/rxdart.dart';

class OrderDetailsBloc {
  final orderRepository = OrderRepository();
  final BehaviorSubject<List<MyList>> _subject = BehaviorSubject<List<MyList>>();

  getOrderList(String user_id) async {
    final response = await orderRepository.fetchOrderList(user_id: user_id);
    var orderlist=OrderListModelClass.fromJson(response);
    List<MyList>myoreder=orderlist.list;
    _subject.sink.add(myoreder);
  }

  void drainStream() {
    _subject.value = null;
  }

  void dispose() async {
    await _subject.drain();
    _subject.close();
  }
  BehaviorSubject<List<MyList>> get subject => _subject;
}
final orderDetailsBlocList = OrderDetailsBloc();
