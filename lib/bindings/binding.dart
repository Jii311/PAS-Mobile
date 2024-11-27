import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:pas1_mobile_11pplg2_11/controllers/dashboard_controller.dart';
import 'package:pas1_mobile_11pplg2_11/controllers/post_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => PostController());
  }
}
