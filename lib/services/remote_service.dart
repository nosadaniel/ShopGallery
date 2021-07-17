import 'package:http/http.dart' as http;
import 'package:product_gallery/models/product.dart';
import 'package:get/get.dart';

class RemoteService {
  static var client = http.Client();

  static Future<List<Product>?> fetchData() async {
    try {
      var response = await client.get(Uri.parse(
          'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productFromJson(jsonString);
      } else {
        Get.snackbar("Server Error", "Fail to fetch data");
      }
    } finally {
      client.close();
    }
  }
}
