import 'package:get_storage/get_storage.dart';

class SharedPreference {
  String userID = "userID";
  final box = GetStorage();
  addStringToSF(String str, String val)async{
    box.write(str, val);

  }
  addBoolToSF(String str, bool val) async {
    box.write(str, val);
  }
  addIntToSF(String str, int val) async {
    box.write(str, val);
  }
  remove(String str) async{
    box.remove(str);
  }

}