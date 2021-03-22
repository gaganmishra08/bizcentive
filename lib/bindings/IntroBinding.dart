import 'package:fixurbiz_app/controller/IntroController.dart';
import 'package:get/get.dart';

class IntroBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());

  }

}