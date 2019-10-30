import 'package:http/http.dart' as http;
import 'package:tabdeel/backend/Users/Model/driver_model.dart';

Future<http.Response> registerDriver(DriverModel model) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Drivers/NewDriver.php";

  var client = http.Client();

  try {
    return await client.post(baseURL, body: model.toMap());
  } finally {
    client.close();
  }
}

Future<http.Response> loginDriver(String mobile, String password) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Drivers/DriverLogin.php?mobile=$mobile&password=$password";
  var client = http.Client();
  try {
    return await client
        .get(baseURL);
  } finally {
    client.close();
  }
}

Future<http.Response> rateDriver(
    String driverID, String rate, String comment) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Drivers/RateDriver.php";
  var client = http.Client();
  try {
    return await client.get(baseURL,
        headers: {"DriverID": driverID, "Rate": rate, "Comment": comment});
  } finally {
    client.close();
  }
}

Future<http.Response> forgetPasswordDriver(String mobile) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Drivers/ForgetDriverPassword.php";
  var client = http.Client();
  try {
    return await client.get(baseURL, headers: {
      "Mobile": mobile,
    });
  } finally {
    client.close();
  }
}

Future<http.Response> updateDriverLastLogin(String driverID) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Drivers/UpdateLastLogin.php";
  var client = http.Client();
  try {
    return await client.get(baseURL, headers: {
      "DriverID": driverID,
    });
  } finally {
    client.close();
  }
}
