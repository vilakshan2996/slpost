import 'package:get/get.dart';
import 'package:slpost/app/data/models/parcel.dart';
import 'package:slpost/app/data/services/firebase_services.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var isInitialized = false.obs;
  
  
  final count = 0.obs;


  var selectedIndex = 0.obs;

  void changeSelectedIndex(int index) {
    print(index);
    selectedIndex.value = index;
  }


  @override
  void onInit() async {
    // await FirebaseServices.getRate();
    print("Firestore services is accepted before building the Home View");
    isInitialized.value = true;
    update();
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



  void increment() => count.value++;
}
