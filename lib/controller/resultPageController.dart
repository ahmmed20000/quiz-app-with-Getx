import 'package:get/get.dart';

class resultPageController extends GetxController {
  int mark = 10;
  int result = 5;
  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    mark = Get.arguments[0];
    result = Get.arguments[1];
    
  }
  
}
