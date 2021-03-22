import 'package:fixurbiz_app/Model/sales_Model.dart';
import 'package:get/get.dart';

class SalesController extends GetxController {
  var salesCard = List<SalesModel>().obs;

  @override
  void onInit() {
    super.onInit();
    _loadCardItems();
  }

  void _loadCardItems() {
    salesCard.assignAll([

      SalesModel("Lead Generation",'Our team of experts will generate curated, qualified leads for your business. Depending on the nature of your business, we will generate leads to help you engage and/or close deals with your clients. Please click on this card for more details.',),
      SalesModel( "Build a Sales Process", 'Our team of experts will generate curated, qualified leads for your business. Depending on the nature of your business, we will generate leads to help you engage and/or close deals with your clients. Please click on this card for more details.',),
      SalesModel("Lead Generation",'Our team of experts will generate curated, qualified leads for your business. Depending on the nature of your business, we will generate leads to help you engage and/or close deals with your clients. Please click on this card for more details.',)
    ]);
  }

}

