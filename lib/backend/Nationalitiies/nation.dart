
import 'package:http/http.dart';

Future<Response> getAllNationalities()async{

  var baseURL="http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Drivers/GetAllNationalities.php";
  
  var client = Client();
try {
    return await client.get(baseURL);
  } finally {
    client.close();
  }
}