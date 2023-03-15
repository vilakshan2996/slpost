import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:slpost/app/data/models/parcel.dart';
import 'package:slpost/app/modules/package/views/custom_package.dart';
import 'package:slpost/app/widgets/custom_input.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/package_controller.dart';

class PackageView extends GetResponsiveView {
  
  final List<Rx<ParcelType>> listOfMails;

  PackageView({Key? key, required this.listOfMails}) : super(key: key);
  final PackageController controller = Get.put(PackageController());
  

  
  @override
  Widget? phone() {
    controller.activeListOfParcels = listOfMails;
    // TODO: implement phone
    return VStack(
      [
        // TODO: Add up your widgets
       InputWidget(),
        const SizedBox(
          height:5,
        ),
        buildCountrySelectorWidget(),
        Expanded(child: ListView.builder(keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,itemCount: listOfMails.length,itemBuilder:(BuildContext context, int index) {

          debugPrint(">>>>>>>>>>> ListView Builder is called <<<<<<<<<<<<<");
         debugPrint(">>>>>>>>>>> Number of Items in the List View builder is ${listOfMails.length} <<<<<<<<<<<");
          final int count =
                    listOfMails.length > 10 ? 10 : listOfMails.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: controller.animationController!,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                controller.animationController?.forward();
              return CustomPackageView(
                  packageData: listOfMails[index],
                  animation: animation,
                  animationController: controller.animationController!,
                );
              } ))
      ],crossAlignment: CrossAxisAlignment.center,
      
    ).p12();
  }

  @override
  Widget? desktop() {
    controller.activeListOfParcels = listOfMails;
    // TODO: implement desktop
    return Scaffold(
        body: VStack(
      [
        Row(
          // ignore: sort_child_properties_last
          children: [
            SizedBox(width: Get.width * 0.2, child: InputWidget()),
            const SizedBox(
              width: 10,
            ),
            buildCountrySelectorWidget(),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
        ),
        Expanded(
          child: GridView.builder(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
              itemCount: listOfMails.length,
              itemBuilder: (BuildContext context, int index) {
                final int count =
                    listOfMails.length > 10 ? 10 : listOfMails.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: controller.animationController!,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                controller.animationController?.forward();

                return CustomPackageView(
                  packageData: listOfMails[index],
                  animation: animation,
                  animationController: controller.animationController!,
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.5)),
        ),
        VxBox(child: ("Welcome to our app, where you can find the international delivery rate of Sri Lankan Post for various types of mail. Whether you want to send a letter, a packet, an air mail or a sea mail, we have the latest and accurate information for you. You can compare the prices and delivery times of different destinations and choose the best option for your needs. Our app is easy to use and reliable, and we update our data regularly from the official sources. With our app, you can save time and money on your international mail with Sri Lankan Post.").text.makeCentered()).make(),
        
        VxBox(child: "Don't miss out on our latest updates! Stay tuned and be the first to know about our upcoming releases".text.center.make()).p12.make(),
        
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).p12());
  }
  

  GetX<PackageController> buildCountrySelectorWidget() {
    return GetX<PackageController>(builder: (controller) {
            return ElevatedButton(
              onPressed: () {
                showCountryPicker(
                  context: Get.context!,
                  //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                  favorite: <String>['US'],
                  //Optional. Shows phone code before the country name.
                  showPhoneCode: false,
                  onSelect: (Country country) {
                    controller.whenCountrySelected(country);
                  },

                  // Optional. Sets the theme for the country list picker.
                  countryListTheme: CountryListThemeData(
                    // Optional. Sets the border radius for the bottomsheet.
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    // Optional. Styles the search field.
                    inputDecoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Start typing to search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
                    ),
                    // Optional. Styles the text in the search field
                    searchTextStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                );
                
              },
              child: Text(controller.country.value.name.toString()),
            );
          });
  }
}

class FitnessAppTheme {
  FitnessAppTheme._();
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Roboto';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}
