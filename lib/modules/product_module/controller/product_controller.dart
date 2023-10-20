import 'package:get/get.dart';

class ProductController extends GetxController{
  int currentImageIndex=0;
  updateCurrentImageIndex(int index){
    currentImageIndex=index;
    update();
  }
}