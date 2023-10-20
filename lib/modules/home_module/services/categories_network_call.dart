import 'package:dio/dio.dart';
import 'package:ecommerce/API/api_services.dart';
import 'package:ecommerce/modules/home_module/model/CategoryModel.dart';

class CategoryNetworkCall {
  static Future<List<CategoryModel>?> getCategorys() async {
    try {
      Response<dynamic> response = await ApiService.getCategories();
      if (ApiService.checkSuccess(response.statusCode!)) {
        List<CategoryModel> categories = [];
        for (var i = 0; i < response.data.length; i++) {
          categories.add(CategoryModel.fromJson(response.data[i]));
        }
        return categories;
      } else {
        return null;
      }
    } catch (e) {
      print("API call error: $e");
    }
    return null;
  }
}
