import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:slpost/app/data/constants.dart';
import 'package:slpost/app/modules/package/controllers/package_controller.dart';

class InputWidget extends StatelessWidget {

  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  InputWidget({super.key});
  final PackageController controller = Get.find<PackageController>();
final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
  
    

    return Form(
      key: _key,
      child: TextFormField(
         keyboardType: TextInputType.number,
        controller: _textController,
        validator: (value) {
          // Check if value is null or empty
          if (value == null || value.isEmpty) {
            return 'Please enter the weight';
          }
          // Check if value is not a number or not positive
          int? number = int.tryParse(value);
          if (number == null || number < 0) {
            return 'Invalid input';
          }
          // No error
          return null;
        },

        
        onFieldSubmitted: (value) {
            if (_key.currentState!.validate()) {
            controller.weight = int.parse(value);
            controller.calculateFees();
              }

        },
       
        decoration: InputDecoration(
          hintText: "Enter Weight in gram",
          fillColor: kBgLightColor,
          filled: true,
          suffixText: "g",
          suffixIcon: Padding(
            padding:  EdgeInsets.all(kDefaultPadding * 0.75), //15
            child: GestureDetector(
              onTap: (){
                  if (_key.currentState!.validate()) {
            controller.weight = int.parse(_textController.text);
            controller.calculateFees();


              }

              },
              child: Icon(Icons.search,)
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
