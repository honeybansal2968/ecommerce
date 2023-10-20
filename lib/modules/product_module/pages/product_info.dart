import 'package:ecommerce/modules/home_module/model/productModel.dart';
import 'package:ecommerce/modules/product_module/controller/product_controller.dart';
import 'package:ecommerce/ui_utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInfoScreen extends StatelessWidget {
  ProductModel product;
  ProductInfoScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText.appText(
            text: "Details",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {},
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
              ),
              child: const Center(
                  child: Text(
                "BUY NOW",
                style: TextStyle(color: Colors.white),
              )),
            ),
          )),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            GetBuilder<ProductController>(
                init: ProductController(),
                builder: (controller) {
                  return Center(
                    child: Stack(
                      children: [
                        Container(
                            height: 200,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 10, color: Colors.white)),
                            child: PageView.builder(
                              itemCount: product.images!
                                  .length, // Change this to the number of images you have
                              onPageChanged: controller.updateCurrentImageIndex,
                              itemBuilder: (BuildContext context, int index) {
                                return Image.network(
                                  product.images![index],
                                  fit: BoxFit.cover,
                                );
                              },
                            )),
                        Positioned(
                          bottom: 20,
                          left: MediaQuery.of(context).size.width / 2 - 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              product.images!
                                  .length, // Change this to match the number of images
                              (index) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.currentImageIndex == index
                                      ? const Color.fromARGB(255, 0, 0, 0)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.appText(
                    text: product.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                AppText.appText(
                    text: "\$ ${product.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AppText.appText(
                text: product.description!,
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 91, 91, 91)))
          ],
        ),
      )),
    );
  }
}
