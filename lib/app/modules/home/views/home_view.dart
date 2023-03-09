import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:slpost/app/data/constants.dart';
import 'package:slpost/app/data/models/parcel.dart';
import 'package:slpost/app/data/services/firebase_services.dart';
import 'package:slpost/app/modules/home/views/package_options_view.dart';
import 'package:slpost/app/modules/home/widgets/sidemenu_item.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (GetPlatform.isDesktop)
            ? Row(
                children: [
                  Expanded(flex: 1, child: HeroMenu()),
                  Expanded(flex: 3, child: HeroMainSection())
                ],
              )
            : Column());
  }
}

// class HeroMenu extends StatelessWidget {
//   const HeroMenu({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return  Container(
//       height: Get.height*0.8,
//       child: GetX<HomeController>(
//         builder: (controller) {
//           return Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                AnimatedButton(
//             text: 'Air Mail',
//            icon: FaIcon(FontAwesomeIcons.plane),
//             onPressed: () => controller.changeSelectedIndex(0),
//             color: controller.selectedIndex==0?Colors.purple:Colors.green),
//                   AnimatedButton(
//             text: 'Sea Mail',
//            icon: FaIcon(FontAwesomeIcons.ship),
//             onPressed: () => controller.changeSelectedIndex(1),
//             color: controller.selectedIndex==1?Colors.purple:Colors.green),
//                   AnimatedButton(
//             text: 'Air Mail',
//            icon: FaIcon(FontAwesomeIcons.plane),
//             onPressed: () => controller.changeSelectedIndex(2),
//             color: controller.selectedIndex==2?Colors.purple:Colors.green)]);
//         },
//       )
//     );

//   }}

class HeroMenu extends StatelessWidget {
  const HeroMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kDefaultPadding),
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/fitness_app/letter.png",
                    width: 46,
                  ),
                  Spacer(),
                  // We don't want to show this close button on Desktop mood
                  // if (!Responsive.isDesktop(context)) CloseButton(),
                ],
              ),
             
              

              SizedBox(height: kDefaultPadding * 2),
              // Menu Items
              GetX<HomeController>(
                builder: (controller) => MouseRegion(
                  onHover: (event) => controller.changeHover(true,0),
                  onExit: (event) => controller.changeHover(false,-1),

                  child: SideMenuItem(
                    press: () => controller.changeSelectedIndex(0), // change index on press
                    title: "Inbox",
                    iconSrc: "assets/Icons/Inbox.svg",
                    isActive:
                        controller.selectedIndex == 0, // set isActive based on index
                        isHover:
                        controller.hoverIndex.value == 0,
                  ),
                ),
              ),
              GetX<HomeController>(
                builder: (controller) {
                  print("Hovered");
                  print(controller.isHover);
                  print(controller.hoverIndex);
                  return MouseRegion(
                  onHover: (event){
                    controller.changeHover(true,1);

                  } ,
                  onExit: (event) => controller.changeHover(false,-1),
                  child: SideMenuItem(
                    press: () => controller.changeSelectedIndex(1), // change index on press
                    title: "Sent",
                    iconSrc: "assets/Icons/Send.svg",
                    isActive:
                        controller.selectedIndex == 1, // set isActive based on index
                        isHover:
                        controller.hoverIndex.value == 1,
                  ),
                );


                } 
              ),
              GetX<HomeController>(
                builder: (controller) => MouseRegion(
                  onHover: (event) => controller.changeHover(true,2),
                  onExit: (event) => controller.changeHover(false,-1),
                  
                  child: SideMenuItem(
                    press: () => controller.changeSelectedIndex(2), // change index on press
                    title: "Drafts",
                    iconSrc: "assets/Icons/File.svg",
                    isActive:
                        controller.selectedIndex == 2, // set isActive based on index
                    isHover:
                        controller.hoverIndex == 2,
                  ),
                ),
              ),
              
              
             
              SizedBox(height: kDefaultPadding * 2),
              // Tags
              // Tags(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroMainSection extends StatelessWidget {
  const HeroMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        switch (controller.selectedIndex.value) {
          case 0:
            return PackageOptionsView(
              listOfMails: Mails.seamails,
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
        ));
  }
}
