import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  String userID = "userID";
  addStringToSF(String str, String val)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(str, val);
  }
  addBoolToSF(String str, bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('str', val);
  }
  addIntToSF(String str, int val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('str', val);
  }
  Future<String> getUserid() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = prefs.getString(userID);
    return res;
  }
}