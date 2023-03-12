
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import 'app/routes/app_pages.dart';

void main() async{
  GoogleFonts.config.allowRuntimeFetching = false;
 
  
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
