import 'package:ecommerce/modules/home_module/model/productModel.dart';
import 'package:ecommerce/modules/product_module/pages/product_info.dart';
import 'package:ecommerce/ui_utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductCard extends StatelessWidget {
  ProductModel product;
  ProductCard({super.key, required this.product});
  Future<bool> _isImageAccessible(String imageUrl) async {
    try {
      final response = await http.head(Uri.parse(imageUrl));
      return response.statusCode == 200;
    } catch (error) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isImageAccessible(product.images![0]),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(); // Show a loading indicator while checking image accessibility
        } else {
          return InkWell(
            onTap: () {
              Get.to((() => ProductInfoScreen(product: product)));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 255, 255, 255)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Center(
                    //   child: Container(
                    //       height: 100,
                    //       width: 100,
                    //       padding: const EdgeInsets.only(top: 10),
                    //       child: Image.network(
                    //         product.images![0],
                    //         errorBuilder: (BuildContext context, Object error,
                    //             StackTrace? stackTrace) {
                    //           return const SizedBox(
                    //             child: Text("no data loaded"),
                    //           );
                    //         },
                    //       )),
                    // ),
                    const SizedBox(
                      height: 4,
                    ),
                    AppText.appText(
                      text: product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                      child: Text(
                        product.description!,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.appText(
                            text: "\$ ${product.price}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(
                            height: 30,
                            width: 30,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ]),
            ),
          );
        }
      },
    );
  }
}
