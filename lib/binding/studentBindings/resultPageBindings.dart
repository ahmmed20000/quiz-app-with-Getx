import 'package:get/get.dart';
import 'package:quizmopile/controller/resultPageController.dart';


class resultPageBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => resultPageController());
  }
}
