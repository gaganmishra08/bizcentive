import 'package:fixurbiz_app/Model/sales_Model.dart';
import 'package:get/get.dart';

class ActivityController extends GetxController {
  var activityCard = List<ActivityModel>().obs;
  var options = List<Activity>().obs;

  @override
  void onInit() {
    super.onInit();
    _loadCardItems();
    _loadOptions();
  }

  void _loadCardItems() {
    activityCard.assignAll([

      ActivityModel("Get 40% off on Premium Laptops,Accessories,Switches and Routers",'Our team of experts will generate curated, qualified leads for your business. Depending on the nature of your business, we will generate leads to help you engage and/or close deals with your clients. Please click on this card for more details.',),
      ActivityModel( "Get 40% off on Premium Laptops,Accessories,Switches and Routers", 'Our team of experts will generate curated, qualified leads for your business. Depending on the nature of your business, we will generate leads to help you engage and/or close deals with your clients. Please click on this card for more details.',),
      ActivityModel("Get 40% off on Premium Laptops,Accessories,Switches and Routers",'Our team of experts will generate curated, qualified leads for your business. Depending on the nature of your business, we will generate leads to help you engage and/or close deals with your clients. Please click on this card for more details.',)
    ]);
  }
void _loadOptions(){
    options.assignAll([
      Activity("Save Bizcentive Card"),
      Activity("Accepted Bizcentive Card"),
      Activity("Rejected Bizcentive Card"),
    ]);
}
}