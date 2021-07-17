import 'package:flutter/material.dart';
import 'package:product_gallery/models/product.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  ProductTile({required this.product});
  Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  child: Image.network(
                    product.imageLink.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 5,
                  child: Obx(
                    () => CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: product.isFavorite.value
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(Icons.favorite_border_rounded),
                        onPressed: () {
                          product.isFavorite.toggle();
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              product.name.toString(),
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w900),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            if (product.rating != null)
              Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  children: [
                    Text(
                      product.rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 5,
            ),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
