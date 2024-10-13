import 'package:get/get.dart';
import 'package:quizmopile/controller/QuistionPageController.dart';


class QuistionPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(QuistionPageController());
    // TODO: implement dependencies
  }
}
