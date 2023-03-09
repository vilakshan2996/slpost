import 'package:get/get.dart';
import 'package:slpost/app/data/models/parcel.dart';
import 'package:slpost/app/data/services/firebase_services.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  


  var selectedIndex = 0.obs;
  var isHover = false.obs; 
  var hoverIndex = (-1).obs; // observable variable


  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  void changeHover(bool value,int index) {
    isHover.value = value; // update value
    hoverIndex.value = index;
    update(); // update GetX widget
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
