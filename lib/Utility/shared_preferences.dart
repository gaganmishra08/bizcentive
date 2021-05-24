import 'package:get_storage/get_storage.dart';

class SharedPreference {
  String userID = "userID";
  final box = GetStorage();
  addStringToSF(String str, String val)async{
    return box.write(str, val);

  }
  addBoolToSF(String str, bool val) async {
    return box.write(str, val);
  }
  addIntToSF(String str, int val) async {
    return box.write(str, val);
  }
  remove(String str) async{
   return box.remove(str);
  }
   readCount(String str)async{
    return box.read(str);
  }

}