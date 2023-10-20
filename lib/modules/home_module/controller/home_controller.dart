import 'package:ecommerce/modules/home_module/model/CategoryModel.dart';
import 'package:ecommerce/modules/home_module/model/productModel.dart';
import 'package:ecommerce/modules/home_module/services/categories_network_call.dart';
import 'package:ecommerce/modules/home_module/services/product_network_call.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
 

  // handle products list
  List<ProductModel>? productList = [];

  fetchAllProducts() async {
    Future<List<ProductModel>?> valueData = ProductNetworkCall.getProducts();
    productList = await valueData;
    update();
  }

  List<CategoryModel>? categories = [];
  fetchAllCategories() async {
    Future<List<CategoryModel>?> valueData = CategoryNetworkCall.getCategorys();
    categories = await valueData;
    update();
  }
  fetchProductsByCategory(int category) async {
    Future<List<ProductModel>?> valueData =
        ProductNetworkCall.getProductsByCategory(category);
    productList = await valueData;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchAllProducts();
    await fetchAllCategories();
  }
}

class CategoryController extends GetxController {
 // handle category
  int currentCategoryIndex = 0;
  updateCurrentCategory(int index) {
    currentCategoryIndex = index;
    update();
  }
}