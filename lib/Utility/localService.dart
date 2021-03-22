
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalService {
  //todo user profile
  static String userId = "userData";

  // firstname String USER_MNAME = "middlename";
  //  String USER_LNAME = "lastname";
  //  String USER_EMAIL = "email";
  //  String USER_REGION = "region";
  //  String USER_COUNTRY= "country";
  //  String USER_COUNTRYCODE= "countryCode";
  //  String USER_PHONE= "phno";
  //  String USER_IMAGEURL= "imageUrl";

  final _box = GetStorage();
  final _key = 'isDarkMode';

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  void saveData(String key, var value) {
    _box.write(key, value);
  }

  dynamic getData(String key) {
    return _box.read(key);
  }

  clearStorage() {
    print("clearStorage");
    _box.erase();
  }
}
  String get kUserData {

  Map<String, dynamic> json = LocalService().getData(LocalService.userId) ;
  if (json != null){
    return json.toString();
  }
 return null;

}


bool get isLogin{
  if(kUserData != null){
    return true;
  }else{
    return false;
  }

}
