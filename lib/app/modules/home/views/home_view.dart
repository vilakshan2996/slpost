import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:slpost/app/data/models/parcel.dart';
import 'package:slpost/app/data/services/firebase_services.dart';
import 'package:slpost/app/modules/home/views/airrate_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: (GetPlatform.isDesktop)?Row(
        children: [
          Expanded(flex: 1,child: HeroMenu()),
          Expanded(flex:3,child: HeroMainSection())
        ],
      ):Column()
    );
  }
}

class HeroMenu extends StatelessWidget {
  const HeroMenu({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  Container(
      height: Get.height*0.8,
      child: GetX<HomeController>(
        builder: (controller) {
          return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,          
                children: [
                  ElevatedButton(
                    onPressed: () => FirebaseServices.getRate(),
                    child: Text('Option 1'),
                  ),
                  
                  AnimatedButton(
            text: 'Sea Mail',
           icon: FaIcon(FontAwesomeIcons.ship), 
            onPressed: () => controller.changeSelectedIndex(1),
            color: controller.selectedIndex==1?Colors.purple:Colors.green),
                  AnimatedButton(
            text: 'Air Mail',
           icon: FaIcon(FontAwesomeIcons.plane), 
            onPressed: () => controller.changeSelectedIndex(2),
            color: controller.selectedIndex==2?Colors.purple:Colors.green)]);
        },
      )
    );
         
  }}
class HeroMainSection extends StatelessWidget {
  const HeroMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
  builder: (controller) {
    switch (controller.selectedIndex.value) {
      case 0:
        return GetBuilder<HomeController>(
      builder: (_) {
        if (controller.isInitialized.value) {
          print("The controller is initialized: ${controller.initialized}");
          // Build the widget with the data from the controller
          return MealsListView();
        } else {
          // Show a loading indicator while waiting for the controller to initialize
          return CircularProgressIndicator();
        }
      },
    );
      case 1:
        return Container(
          color: Colors.green,
          child: Center(child: Text('Option 2 selected')),
        );
      case 2:
        return Container(
          color: Colors.blue,
          child: Center(child: Text('Option 3 selected')),
        );
      default:
        return Container();
    }
  },
);

  }
}

class AnimatedButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  final Widget? icon;

  const AnimatedButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final hoverTextStyle = TextStyle(
      color: widget.color,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
  duration: Duration(milliseconds: 200),
  height: 50,
  width: _isHovering ? 200 : 150,
  decoration: BoxDecoration(
    border: _isHovering ? Border.all(color: Colors.black) : null,
    color: _isHovering ? Colors.white : widget.color,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ),
  ),
  transform: _isHovering
      ? Matrix4.translationValues(20, 0, 0)
      : Matrix4.translationValues(0, 0, 0),
  child: Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: widget.onPressed,
      child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) widget.icon!,
                SizedBox(width: 8),
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  style: _isHovering ? hoverTextStyle : defaultTextStyle,
                  child: Text(widget.text),
                ),
              ],
            ),
    ),
  ),
)

    );
  }
}