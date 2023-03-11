import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:slpost/app/data/constants.dart';
import 'package:slpost/app/data/models/parcel.dart';
import 'package:slpost/app/data/services/firebase_services.dart';
import 'package:slpost/app/modules/home/views/package_options_view.dart';
import 'package:slpost/app/modules/home/widgets/sidemenu_item.dart';
import 'package:velocity_x/velocity_x.dart';

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
                    press: () {
                      controller.changeSelectedIndex(0);

                    }, // change index on press
                    title: "AirMail",
                    iconSrc: "assets/Icons/Air mail.svg",
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
    return 
      VxBox(
        child: GetX<HomeController>(
          builder: (controller) {
            switch (controller.selectedIndex.value) {
              case 0:
                return PackageOptionsView(
                  listOfMails: Mails.seamails,
                );
              case 1:
                return PackageOptionsView(
                  listOfMails: Mails.seamails,
                );
              case 2:
                return PackageOptionsView(
                  listOfMails: Mails.seamails,
                );
              default:
                return Container();
            }
          },
          ),
      ).px12.color(kBgDarkColor).make();
  }
}


