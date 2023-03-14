import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:slpost/app/data/models/parcel.dart';

class HomeController extends GetxController {

  List<String> shipmailAllowedCountries = ["AU","AT","BY","CA","CN","CZ","DK","FI","FR","DE","GB","GR","HK","IS","IN","IE","IL","IT","JP","KR","MY","MV","MM","NL","NZ","NO","PH","PL","RU","SG","ZA","ES","SE","CH","TH","AE","UA","US"];
  //TODO: Implement HomeController

  var selectedIndex = 0.obs;
  var isHover = false.obs;
  int weight = 0;
  var isAvailabe = true.obs;
  var hoverIndex = (-1).obs; // observable variable


  var country = Country(phoneCode: "+1", countryCode: "+1", e164Sc: 0, geographic: true, level: 1, name: "United States", example: "2012345678", displayName: "United States (US) [+1]", displayNameNoCountryCode:"United States (US)", e164Key: "1-US-0",group: "H").obs;
  List<Rx<ParcelType>> activeListOfParcels = [];


  void selectCountry(Country country) {

    this.country.value = country;
    if(selectedIndex.value ==0){
      if(country.groupName == ""){
        isAvailabe.value = false;
      }else{
        isAvailabe.value= true;
        calculateFees();
      }
    } else if(selectedIndex.value ==1){
      if(shipmailAllowedCountries.contains(country.countryCode)){
        isAvailabe.value = true;
        calculateFees();
      }else{
        isAvailabe.value = false;
      }
    }
    

    
  }

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void changeHover(bool value, int index) {
    isHover.value = value; // update value
    hoverIndex.value = index; // update GetX widget
  }


  void calculateFees(){
    for (Rx<ParcelType> parcel in activeListOfParcels) {
      parcel.update((val) {
        parcel.value.findFees(weight, country.value);
       });
      
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
