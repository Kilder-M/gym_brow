import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //views controller
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
