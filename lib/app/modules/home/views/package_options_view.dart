import 'dart:ui';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slpost/app/data/constants.dart';
import 'package:slpost/app/data/models/parcel.dart';
import 'package:slpost/app/modules/home/controllers/home_controller.dart';
import 'package:slpost/app/modules/home/widgets/input_field.dart';
import 'package:velocity_x/velocity_x.dart';

class PackageOptionsView extends StatefulWidget {
  List<ParcelType> listOfMails;
  PackageOptionsView({Key? key, required this.listOfMails}) : super(key: key);

  @override
  _PackageOptionsViewState createState() => _PackageOptionsViewState();
}

class _PackageOptionsViewState extends State<PackageOptionsView>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    controller.activeListOfParcels.value = widget.listOfMails;
    return VStack(
      [
        HStack(
          [
            SizedBox(width: Get.width * 0.2, child: InputWidget()),
            SizedBox(
              width: 10,
            ),
            GetX<HomeController>(builder: (controller) {
              return ElevatedButton(
                onPressed: () {
                  showCountryPicker(
                    context: context,
                    //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                    favorite: <String>['US'],
                    //Optional. Shows phone code before the country name.
                    showPhoneCode: false,
                    onSelect: (Country country) {
                      controller.selectCountry(country);
                      

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
            }),
          ],
        ),
        Expanded(
          child: GridView.builder(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
              itemCount: widget.listOfMails.length,
              itemBuilder: (BuildContext context, int index) {
                final int count = widget.listOfMails.length > 10
                    ? 10
                    : widget.listOfMails.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animationController!,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                animationController?.forward();

                return PackageView(
                  mealsListData: widget.listOfMails[index],
                  animation: animation,
                  animationController: animationController!,
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 250,
              )),
        )
      ],
      crossAlignment: CrossAxisAlignment.center,
    );
  }
}

class PackageView extends StatelessWidget {
  final controller = Get.find<HomeController>();
  PackageView(
      {Key? key, this.mealsListData, this.animationController, this.animation})
      : super(key: key);

  final ParcelType? mealsListData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation!.value), 0.0, 0.0),
            child: SizedBox(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 8, right: 8, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color(mealsListData!.endColor)
                                  .withOpacity(0.6),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(mealsListData!.startColor),
                            Color(mealsListData!.endColor),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(54.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 54, left: 16, right: 16, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SelectableText(
                              mealsListData!.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: FitnessAppTheme.fontName,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                letterSpacing: 0.2,
                                color: FitnessAppTheme.white,
                              ),
                            ),
                            Expanded(
                                child: VStack(
                              [
                                // TODO: Add up your widgets
                                (mealsListData?.MaximumWeight != null)
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SelectableText(
                                            "Maximum Weight : ${mealsListData?.MaximumWeight}kg",
                                            style: TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              letterSpacing: 0.2,
                                              color: FitnessAppTheme.white,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Obx(() => SelectableText(
                                          "Non registered fee : Lkr ${mealsListData?.nonRegisteredFees.value}",
                                          style: TextStyle(
                                            fontFamily:
                                                FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            letterSpacing: 0.2,
                                            color: FitnessAppTheme.white,
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ).paddingOnly(top: 10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 4, bottom: 3),
                                  child: SelectableText(
                                    'Lkr',
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      letterSpacing: 0.2,
                                      color: FitnessAppTheme.white,
                                    ),
                                  ),
                                ),
                                Obx(() => SelectableText(
                                      "${mealsListData?.fees.value}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 30,
                                        letterSpacing: 0.2,
                                        color: FitnessAppTheme.white,
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -15,
                    left: -5,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FitnessAppTheme.nearlyWhite.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: -10,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(mealsListData!.imagePath),
                    ),
                  ),

                   Obx(() =>  (mealsListData!.isWeightExceeded.value) ?ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            child:
                                "Maximum Weight Allowed is ${mealsListData!.MaximumWeight}".text.makeCentered(),
                          ),
                        ),
                      ):Container()
                      
                      ),

                  Obx(() =>  (!controller.isAvailabe.value) ?ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            child:
                                "Service Is Not Available".text.makeCentered(),
                          ),
                        ),
                      ):Container()
                      
                      ),
                     
                  
                      
                      
                ],
              ),
            ),
          ),
        );
      },
    );
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
