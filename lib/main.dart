import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_gallery/binding/product_binding.dart';

import 'screen/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: "/",
          page: () => MyHomePage(),
          binding: ProductBinding(),
        )
      ],
    );
  }
}
