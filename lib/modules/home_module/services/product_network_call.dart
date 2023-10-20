import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecommerce/API/api_services.dart';
import 'package:ecommerce/modules/home_module/model/productModel.dart';

class ProductNetworkCall {
  static Future<List<ProductModel>?> getProducts() async {
    try {
      Response<dynamic> response = await ApiService.getProducts();
      if (ApiService.checkSuccess(response.statusCode!)) {
        List<ProductModel> products = [];
        for (var i = 0; i < response.data.length; i++) {
          products.add(ProductModel.fromJson(response.data[i]));
        }
        return products;
      } else {
        return null;
      }
    } catch (e) {
      print("API call error: $e");
    }
    return null;
  }

  static Future<List<ProductModel>?> getProductsByCategory(int category) async {
    try {
      Response<dynamic> response = await ApiService.getProductsByCategory(category);
      if (ApiService.checkSuccess(response.statusCode!)) {
        List<ProductModel> products = [];
        for (var i = 0; i < response.data.length; i++) {
          products.add(ProductModel.fromJson(response.data[i]));

        }
        return products;
      }
      else {
        return null;
      }
    }
    catch (e) {
      print("API call error: $e");
    }
  }
}
