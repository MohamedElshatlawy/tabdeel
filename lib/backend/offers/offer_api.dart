import 'package:http/http.dart' as http;

Future<http.Response> getAllOffers() async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Shops/GetAllOffers.php";
  var client = http.Client();
  try {
    return await client.get(
      baseURL,
    );
  } finally {
    client.close();
  }
}

Future<http.Response> getOfferDetails(String offerID) async {
  var baseURL =
      "http://riyadasa.com/sites/tabdel/ServiceApis/RestFul/Shops/GetOffer.php";
  var client = http.Client();
  try {
    return await client.get(baseURL, headers: {"OfferID": offerID});
  } finally {
    client.close();
  }
}
