import 'package:get/get.dart';
import 'package:product_gallery/controllers/network_controller.dart';
import 'package:product_gallery/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}
