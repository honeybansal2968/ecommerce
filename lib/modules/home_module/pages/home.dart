import 'package:ecommerce/modules/home_module/controller/home_controller.dart';
import 'package:ecommerce/modules/home_module/pages/components/appbar.dart';
import 'package:ecommerce/modules/home_module/pages/components/categoryWidget.dart';
import 'package:ecommerce/modules/home_module/pages/components/productsGridView.dart';
import 'package:ecommerce/ui_utils/customWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 238, 238, 238),
            appBar: HomePageAppBar(pageContext: context),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CategoryScroll(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.appText(
                            text: "New Arrival",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)),
                        TextButton(
                          onPressed: () {},
                          child: AppText.appText(
                              text: "See all",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                        width: double.infinity, child: ProductGridView()),
                  )
                ],
              ),
            )),
          );
        });
  }
}
