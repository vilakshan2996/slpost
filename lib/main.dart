import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slpost/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async{
  GoogleFonts.config.allowRuntimeFetching = false;
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
