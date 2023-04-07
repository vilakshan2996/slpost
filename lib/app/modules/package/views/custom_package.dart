import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:slpost/app/data/models/parcel.dart';
import 'package:slpost/app/modules/package/controllers/package_controller.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package_view.dart';

class CustomPackageView extends StatelessWidget {
  final controller = Get.find<PackageController>();
  CustomPackageView(
      {Key? key,
      required this.packageData,
      required this.animationController,
      required this.animation})
      : super(key: key);

  final Rx<ParcelType> packageData;
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
              height: 250,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 8, right: 8, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color(packageData.value.endColor)
                                  .withOpacity(0.6),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(packageData.value.startColor),
                            Color(packageData.value.endColor),
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
                              packageData.value.title,
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
                                (packageData.value.maximumWeight != null)
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Obx(() => Seo.text(
                                                text: "Maximum Weight is 2kg",
                                                child: SelectableText(
                                                  "Maximum Weight : ${packageData.value.maximumWeight}kg",
                                                  style: TextStyle(
                                                    fontFamily: FitnessAppTheme
                                                        .fontName,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    letterSpacing: 0.2,
                                                    color:
                                                        FitnessAppTheme.white,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    : Container(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Obx(() {
                                      print(
                                          "Find value method triggered by ${packageData.value.title}");
                                      print(
                                          packageData.value.fees);
                                      return ((packageData
                                                  .value.fees !=
                                              null)
                                          ? Seo.text(
                                              text: "Registered fee : Lkr",
                                              child: SelectableText(
                                                "Registered fee : Lkr ${packageData.value.fees}",
                                                style: TextStyle(
                                                  fontFamily:
                                                      FitnessAppTheme.fontName,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  color: FitnessAppTheme.white,
                                                ),
                                              ),
                                            )
                                          : Container());
                                    }),
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
                                Obx(() {
                                  print(packageData.value.nonRegisteredFees);
                                  return (packageData.value.nonRegisteredFees!=null)?SelectableText(
                                    "${packageData.value.nonRegisteredFees}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                      letterSpacing: 0.2,
                                      color: FitnessAppTheme.white,
                                    ),
                                  ):Container();
                                }),
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
                      child: Image.asset(packageData.value.imagePath),
                    ),
                  ),
                  Obx(() => (packageData.value.isWeightExceeded)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              child:
                                  "Maximum Weight Allowed is ${packageData.value.maximumWeight}kg"
                                      .text
                                      .bold
                                      .xl2
                                      .makeCentered(),
                            ),
                          ),
                        )
                      : Container()),
                  Obx(() => (!controller.isAvailabe.value)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              child: Seo.text(
                                  text: "Service is not available here",
                                  child: "Service Is Not Available"
                                      .text
                                      .makeCentered()),
                            ),
                          ),
                        )
                      : Container()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
