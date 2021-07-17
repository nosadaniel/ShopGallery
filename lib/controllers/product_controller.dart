import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get/get.dart';
import 'package:product_gallery/models/product.dart';
import 'package:product_gallery/services/remote_service.dart';

import 'network_controller.dart';

class ProductController extends GetxController {
  NetworkController networkController = Get.put(NetworkController());

  var products = <Product>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    checkNetwork();
    super.onInit();
  }

  checkNetwork() async {
    DataConnectionStatus status = await networkController.dataConnection();
    if (status == DataConnectionStatus.connected) {
      fetchProduct();
    } else {
      Get.snackbar("Network error", "Check your connection");
    }
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var p = await RemoteService.fetchData();
      if (p != null) {
        products.value = p;
      } else {
        Get.snackbar(
            "Failed to Connect", "Please check your Internet connection");
      }
    } finally {
      isLoading(false);
    }
  }
}
