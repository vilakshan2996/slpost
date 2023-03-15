import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:slpost/app/data/models/parcel.dart';

class HomeController extends GetxController {

  final SidebarXController sidebarXController = SidebarXController(selectedIndex: 0, extended: true);

  var title = ("Air Mail").obs;

  @override
  void onInit() async {

    sidebarXController.addListener(() {
      if(sidebarXController.selectedIndex==0){
        title.value = "Air Mail";
      }else if(sidebarXController.selectedIndex==1){
        title.value = "Sea Mail";
      }
    });
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
