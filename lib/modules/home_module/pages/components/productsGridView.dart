import 'package:ecommerce/modules/home_module/controller/home_controller.dart';
import 'package:ecommerce/modules/home_module/pages/components/productCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      if (controller.productList!.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.productList!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 0.85),
          itemBuilder: (context, index) {
            return ProductCard(
              product: controller.productList![index],
            );
          });
    });
  }
}
