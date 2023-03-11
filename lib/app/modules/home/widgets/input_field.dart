import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:slpost/app/data/constants.dart';
import 'package:slpost/app/modules/home/controllers/home_controller.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final _formKey = GlobalKey<FormState>();
    final _textController = TextEditingController();

    return Form(
      key: _formKey,
      child: TextFormField(
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
        onEditingComplete: () {
           if (_formKey.currentState!.validate()) {
            controller.calculateFees(int.parse(_textController.text));


              }
        },
        decoration: InputDecoration(
          hintText: "Enter Weight in gram",
          fillColor: kBgLightColor,
          filled: true,
          suffixText: "g",
          suffixIcon: Padding(
            padding: const EdgeInsets.all(kDefaultPadding * 0.75), //15
            child: SvgPicture.asset(
              "assets/Icons/Search.svg",
              width: 24,
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
