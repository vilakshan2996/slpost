
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';

import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:seo/html/seo_controller.dart';
import 'package:seo/html/tree/widget_tree.dart';



import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  usePathUrlStrategy();
  
  
  runApp(
   MyApp()
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return  SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Srilankan Postal Rate',
          navigatorObservers: <NavigatorObserver>[observer],
           initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          
        
      ),
    );
  }
}