import 'package:http/http.dart' as http;
import 'package:tabdeel/backend/Users/Model/shop_model.dart';

Future<http.Response> registerShop(ShopModel model) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Shops/NewShop.php";
  var client = http.Client();

  try {
    return await client.post(baseURL, body: model.toMap());
  } finally {
    client.close();
  }
}

Future<http.Response> loginShop(String mobile, String password) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Shops/ShopLogin.php?mobile=$mobile&password=$password";
  var client = http.Client();
  try {
    return await client
        .get(baseURL);
  } finally {
    client.close();
  }
}

Future<http.Response> rateShop(
    String shopID, String rate, String comment) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Shops/RateShop.php";
  var client = http.Client();
  try {
    return await client.get(baseURL,
        headers: {"ShopID": shopID, "Rate": rate, "Comment": comment});
  } finally {
    client.close();
  }
}

Future<http.Response> searchShop(String shopTitle) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Shops/SearchShop.php";
  var client = http.Client();
  try {
    return await client.get(baseURL, headers: {"Title": shopTitle});
  } finally {
    client.close();
  }
}

Future<http.Response> forgetPasswordShop(String mobile) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Shops/ForgetShopPassword.php";
  var client = http.Client();
  try {
    return await client.get(baseURL, headers: {
      "Mobile": mobile,
    });
  } finally {
    client.close();
  }
}

Future<http.Response> getAllShops() async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Shops/GetAllShops.php";
  var client = http.Client();
  try {
    return await client.get(
      baseURL,
    );
  } finally {
    client.close();
  }
}

Future<http.Response> getShopDetails(String shopID) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Shops/GetShop.php?ShopID=$shopID";
  var client = http.Client();
  try {
    return await client.get(baseURL);
  } finally {
    client.close();
  }
}

Future<http.Response> updateShopDeviceID(String ShopID, String deviceID) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Shops/UpdateDeviceID.php";
  var client = http.Client();
  try {
    return await client
        .get(baseURL, headers: {"ShopID": ShopID, "DeviceID": deviceID});
  } finally {
    client.close();
  }
}
