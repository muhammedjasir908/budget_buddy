import 'package:get/get.dart';

class MainController extends GetxController{

  RxInt currentIndex = 0.obs;

  onIndexChange(int index){
    currentIndex.value = index;
  }
}