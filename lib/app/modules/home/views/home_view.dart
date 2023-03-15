import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:slpost/app/data/constants.dart';
import 'package:slpost/app/data/models/parcel.dart';
import 'package:slpost/app/modules/package/views/package_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

class HomeView extends GetResponsiveView {
  final HomeController controller = Get.find<HomeController>();
  HomeView({Key? key}) : super(key: key);

  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget? phone() {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: canvasColor,
        title: Obx(() => Text(controller.title.value)),
        leading: IconButton(
          onPressed: () {
            // if (!Platform.isAndroid && !Platform.isIOS) {
            //   _controller.setExtended(true);
            // }
            _key.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      drawer: ExampleSidebarX(controller: controller.sidebarXController),
      body: Row(
        children: [
          Expanded(
            child: Center(
              child: _ScreensExample(
                controller: controller.sidebarXController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget? desktop() {
    return Scaffold(
      key: _key,
      body: Row(
        children: [
          ExampleSidebarX(controller: controller.sidebarXController),
          Expanded(
            child: Center(
              child: _ScreensExample(
                controller: controller.sidebarXController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/logo.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: FontAwesomeIcons.planeDeparture,
          label: 'Air Mail',
          onTap: () {
            debugPrint('AirMail');
          },
        ),
        const SidebarXItem(
          icon: FontAwesomeIcons.ship,
          label: 'Sea Mail',
        ),
        
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return PackageView(
              listOfMails: Mails.airmails,
            );
          case 1:
            return PackageView(
              listOfMails: Mails.seamails,
            );
          default:
            return Container();
        }
      },
    );
  }
}
