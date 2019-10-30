

import 'package:http/http.dart';
import 'package:tabdeel/backend/Users/Model/client_order_model.dart';

Future<Response>createOrder(ClientOrder order) async {

  var baseURL="http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Orders/NewOrder.php";
   var client = Client();

    
  try {
    print('MYORDER:${order.toMap()}');
    return await client.post(baseURL, body: order.toMap());

    
  } finally {
    client.close();
  }
}