import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_gallery/controllers/network_controller.dart';
import 'package:product_gallery/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:product_gallery/screen/product_tile.dart';

class MyHomePage extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();
  final NetworkController networkController = Get.find<NetworkController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    "ShopX",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.view_list_rounded),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.grid_view),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else {
                if (controller.products.isEmpty) {
                  return Center(
                    child: Text(
                      "No Data Found",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: controller.products.length,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  itemBuilder: (context, index) {
                    return ProductTile(product: controller.products[index]);
                  },
                  staggeredTileBuilder: (index) =>
                      const StaggeredTile.count(1, 1.5),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
