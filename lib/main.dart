import 'package:fixurbiz_app/Utility/google_signin.dart';
import 'package:fixurbiz_app/Utility/localService.dart';
import 'package:fixurbiz_app/Utility/shared_preferences.dart';
import 'package:fixurbiz_app/Views/Activity/accept_card.dart';
import 'package:fixurbiz_app/Views/Activity/reject_card.dart';
import 'package:fixurbiz_app/Views/Activity/save_card.dart';
import 'package:fixurbiz_app/Views/Assisment/assisment.dart';
import 'package:fixurbiz_app/Views/Card/add_card.dart';
import 'package:fixurbiz_app/Views/Discount/discount_type.dart';
import 'package:fixurbiz_app/Views/Govt/grant.dart';
import 'package:fixurbiz_app/Views/Introduction%20Screens/IntroductionView.dart';
import 'package:fixurbiz_app/Views/Activity/activity.dart';
import 'package:fixurbiz_app/Views/Advisor/adviser_view.dart';
import 'package:fixurbiz_app/Views/Card/card_view.dart';
import 'package:fixurbiz_app/Views/Discount/discount_detailsView.dart';
import 'package:fixurbiz_app/Views/Discount/discount_view.dart';
import 'package:fixurbiz_app/Views/Dasboard/homeView.dart';
import 'package:fixurbiz_app/Views/Login/loginView.dart';
import 'package:fixurbiz_app/Views/Profile/profileView.dart';
import 'package:fixurbiz_app/Views/Refer/refre_view.dart';
import 'package:fixurbiz_app/Views/Sales/sales_detailview.dart';
import 'package:fixurbiz_app/Views/Sales/sales_view.dart';
import 'package:fixurbiz_app/Views/Category/selectCategoryView.dart';
import 'package:fixurbiz_app/Views/Login/signupView.dart';
import 'package:fixurbiz_app/Views/Introduction%20Screens/splash_Screen.dart';
import 'package:fixurbiz_app/Views/TabBar/tabBarView.dart';
import 'package:fixurbiz_app/Views/Term/termView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'bindings/IntroBinding.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var res;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefsData();
  }

  getPrefsData() async{
    final box = GetStorage();
    res = box.read("userID");
    print("gagan logout" + res);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: res == null || res == ""
          ? PageIdentifier.splashScreen
          : PageIdentifier.tabPage,
      getPages: [
        GetPage(name: PageIdentifier.intro, page: () => IntroductionView()),
        GetPage(name: PageIdentifier.login, page: () => LoginView()),
        GetPage(name: PageIdentifier.tabPage, page: () => BottomNavBar()),
        GetPage(name: PageIdentifier.signUp, page: () => SignUpView()),
        GetPage(
            name: PageIdentifier.selectCategory, page: () => SelectCategory()),
        GetPage(name: PageIdentifier.home, page: () => HomeView()),
        GetPage(name: PageIdentifier.cardView, page: () => CardView()),
        GetPage(name: PageIdentifier.adviser, page: () => AdviserView()),
        GetPage(name: PageIdentifier.splashScreen, page: () => SplashScreen()),
        GetPage(name: PageIdentifier.salesView, page: () => SalesView()),
        GetPage(
            name: PageIdentifier.salesDetailView,
            page: () => SalesDetailView()),
        GetPage(name: PageIdentifier.discountView, page: () => DiscountView()),
        GetPage(
            name: PageIdentifier.discountDetailView,
            page: () => DiscountDetailView()),
        GetPage(name: PageIdentifier.activityView, page: () => ActivityView()),
        GetPage(name: PageIdentifier.term, page: () => TermsView()),
        GetPage(name: PageIdentifier.refer, page: () => ReferView()),
        GetPage(name: PageIdentifier.addCard, page: () => AddCard()),
        GetPage(name: PageIdentifier.profile, page: () => ProfileView()),
        GetPage(name: PageIdentifier.discountType, page: () => DiscountTypeView()),
        GetPage(name: PageIdentifier.govt, page: () => Grant()),
        GetPage(name: PageIdentifier.accepted, page: () => AcceptedCard()),
        GetPage(name: PageIdentifier.rejected, page: () => RejectedCard()),
        GetPage(name: PageIdentifier.savecard, page: () => SavedCard()),
        GetPage(name: PageIdentifier.assisment, page: () => Assisment())
      ],
    );
  }
}

class PageIdentifier {
  static const tabPage = '/tabView';
  static const intro = '/intro';
  static const getStarted = '/getStarted';
  static const pageController = '/pageController';
  static const completeProfile = '/completeProfile';
  static const login = '/login';
  static const home = '/home';
  static const notification = '/notification';
  static const chat = '/chat';
  static const signUp = '/signUp';
  static const selectCategory = '/selectCategory';
  static const cardView = '/cardView';
  static const adviser = '/adviserView';
  static const splashScreen = '/splashScreen';
  static const salesView = '/salesView';
  static const salesDetailView = '/salesDetailView';
  static const discountView = '/discountView';
  static const discountDetailView = '/discountDetailView';
  static const activityView = '/activityView';
  static const term = '/term';
  static const refer = '/refer';
  static const addCard = '/addCard';
  static const profile = '/profile';
  static const discountType = '/discountType';
  static const govt = '/govt';
  static const accepted = '/accepted';
  static const rejected = '/rejected';
  static const savecard = '/savecard';
  static const assisment = '/assisment';

}
