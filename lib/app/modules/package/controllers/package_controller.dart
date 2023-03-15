import 'package:country_picker/country_picker.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slpost/app/data/models/parcel.dart';
import 'package:slpost/app/modules/home/controllers/home_controller.dart';

class PackageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<String> shipmailAllowedCountries = [
    "AU",
    "AT",
    "BY",
    "CA",
    "CN",
    "CZ",
    "DK",
    "FI",
    "FR",
    "DE",
    "GB",
    "GR",
    "HK",
    "IS",
    "IN",
    "IE",
    "IL",
    "IT",
    "JP",
    "KR",
    "MY",
    "MV",
    "MM",
    "NL",
    "NZ",
    "NO",
    "PH",
    "PL",
    "RU",
    "SG",
    "ZA",
    "ES",
    "SE",
    "CH",
    "TH",
    "AE",
    "UA",
    "US"
  ];

  int weight = 0;
  var isAvailabe = true.obs;
  var country = Country(
          phoneCode: "+1",
          countryCode: "+1",
          e164Sc: 0,
          geographic: true,
          level: 1,
          name: "United States",
          example: "2012345678",
          displayName: "United States (US) [+1]",
          displayNameNoCountryCode: "United States (US)",
          e164Key: "1-US-0",
          group: "H")
      .obs;


  List<Rx<ParcelType>> activeListOfParcels = [];

 

  late AnimationController ?animationController;

  

  
  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    
  }

 

  void calculateFees() {
    debugPrint(".............calculateFees method is Called................");
    for (Rx<ParcelType> parcel in activeListOfParcels) {
      parcel.update((val) {
        parcel.value.findFees(weight, country.value);
      });
    }
  }


  void whenCountrySelected(Country country){
     debugPrint("..............country Select Function is called.............");

        final HomeController controller = Get.find<HomeController>();
        this.country.value = country;
        if (controller.sidebarXController.selectedIndex == 0) {
          if (country.groupName == "") {
            isAvailabe.value = false;
          } else {
            isAvailabe.value = true;
            calculateFees();
          }
        } else if (controller.sidebarXController.selectedIndex == 1) {
          if (shipmailAllowedCountries.contains(country.countryCode)) {
            isAvailabe.value = true;
            calculateFees();
          } else {
            isAvailabe.value = false;
          }
        }
  }

  
}
