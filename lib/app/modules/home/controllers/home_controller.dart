import 'package:get/get.dart';
import 'package:responsive_web_exam/app/data/Models/product_models.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  var isloading = false.obs;
  var producslist = List<Item>.of([]).obs;

  @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }

  Future<Products> getAllProducts() async {
    try {
      isloading(true);
      var url = Uri.parse(
          "https://1hia8orbrk.execute-api.us-east-1.amazonaws.com/prod/products");
      var client = http.Client();
      final response = await client.get(url);
      if (response.statusCode == 200) {
        final Products allitemsbycategory = productsFromJson(response.body);
        producslist.value = allitemsbycategory.items!;
        print("categories data $producslist");
        isloading(false);
        return allitemsbycategory;
      } else {
        throw Exception('failed to fetch items');
      }
    } catch (e) {
      print("Printing exception $e");
      throw Exception(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
