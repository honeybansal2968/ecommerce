import 'package:ecommerce/modules/home_module/controller/home_controller.dart';
import 'package:ecommerce/ui_utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScroll extends StatelessWidget {
  const CategoryScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: GetBuilder<HomeController>(builder: (controller) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories!.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                // Display "All Products" as the first item
                return CategoryItem(category: "All Products", index: 0);
              } else {
                // Adjust index to account for the extra item
                final adjustedIndex = index - 1;
                return CategoryItem(
                  category: controller.categories![adjustedIndex].name!,
                  index: index,
                  categoryIndex: controller.categories![adjustedIndex].id,
                );
              }
            });
      }),
    );
  }
}

class CategoryItem extends StatelessWidget {
  String category;
  int index;
  int? categoryIndex;
  CategoryItem(
      {super.key,
      required this.category,
      required this.index,
      this.categoryIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<HomeController>(builder: (controller) {
          return GetBuilder<CategoryController>(
              init: CategoryController(),
              builder: (categoryController) {
                return ElevatedButton(
                    onPressed: () {
                      if (index == 0) {
                        controller.fetchAllProducts();
                      } else {
                        controller.fetchProductsByCategory(categoryIndex!);
                      }
                      categoryController.updateCurrentCategory(index);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 7),
                        backgroundColor:
                            categoryController.currentCategoryIndex == index
                                ? Colors.black
                                : const Color.fromARGB(255, 227, 227, 227),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: AppText.appText(
                        text: category,
                        style: TextStyle(
                            color:
                                categoryController.currentCategoryIndex == index
                                    ? Colors.white
                                    : const Color.fromARGB(255, 80, 80, 80),
                            fontWeight: FontWeight.w500)));
              });
        }),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
