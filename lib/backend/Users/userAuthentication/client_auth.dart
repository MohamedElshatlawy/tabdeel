import 'package:http/http.dart' as http;
import 'package:tabdeel/backend/Users/Model/client_model.dart';

Future<http.Response> registerClient(ClientModel model) async {
  var baseURL =
      "https://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Clients/NewClient.php";

  var client = http.Client();

  try {
    print('MyClient:${model.toMap()}');
    return await client.post(baseURL, body: model.toMap());

    
  } finally {
    client.close();
  }
}

Future<http.Response> loginClient(String mobile, String password) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Clients/ClientLogin.php?mobile=$mobile&password=$password";

  var client = http.Client();
  try {
    return await client
        .get(baseURL,
        
        );
  } finally {
    client.close();
  }
}

Future<http.Response> forgetPasswordClient(String mobile) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Clients/ForgetClientPassword.php";

  var client = http.Client();
  try {
    return await client.get(baseURL, headers: {
      "Mobile": mobile,
    });
  } finally {
    client.close();
  }
}

Future<http.Response> updateClientDeviceID(
    String clientID, String deviceID) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Clients/UpdateDeviceID.php";
  var client = http.Client();
  try {
    return await client
        .get(baseURL, headers: {"ClientID": clientID, "DeviceID": deviceID});
  } finally {
    client.close();
  }
}

Future<http.Response> updateClientLastLogin(String clientID) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Clients/UpdateLastLogin.php";

  var client = http.Client();
  try {
    return await client.get(baseURL, headers: {
      "ClientID": clientID,
    });
  } finally {
    client.close();
  }
}
