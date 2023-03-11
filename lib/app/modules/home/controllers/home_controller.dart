import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:slpost/app/data/models/parcel.dart';
import 'package:slpost/app/data/services/firebase_services.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var selectedIndex = 0.obs;
  var isHover = false.obs;
  var hoverIndex = (-1).obs; // observable variable


  var country = Country(phoneCode: "+1", countryCode: "+1", e164Sc: 0, geographic: true, level: 1, name: "United States", example: "2012345678", displayName: "United States (US) [+1]", displayNameNoCountryCode:"United States (US)", e164Key: "1-US-0",group: "A").obs;
  var activeListOfParcels = [].obs;


  void selectCountry(Country country) {

    this.country.value = country;
  }

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void changeHover(bool value, int index) {
    isHover.value = value; // update value
    hoverIndex.value = index; // update GetX widget
  }


  void calculateFees(int w){
    for (ParcelType parcel in activeListOfParcels) {
      parcel.findFees(w);
    }
    

  }

  @override
  void onInit() async {

    
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
