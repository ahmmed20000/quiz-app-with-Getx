import 'package:get/get.dart';
import 'package:quizmopile/core/class/curd.dart';




class InitialBindings extends Bindings{
  @override
  void dependencies() {
     
    Get.put(Crud());

  }
  
}