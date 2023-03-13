import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../../../controllers/controller.dart';

class HomeSideBar extends StatelessWidget {
  const HomeSideBar({super.key, required SidebarXController controller})
      : _coursecontroller = controller;
  final SidebarXController _coursecontroller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _coursecontroller,
      theme: const SidebarXTheme(
          selectedTextStyle: TextStyle(
              color: Colors.amber, fontFamily: 'Poppins', fontSize: 16),
          selectedItemTextPadding: EdgeInsets.only(left: 25),
          selectedIconTheme: IconThemeData(color: Colors.amber, size: 24),
          itemTextPadding: EdgeInsets.only(left: 25),
          textStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                  // topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          iconTheme: IconThemeData(color: Colors.white, size: 24)),
      extendedTheme: const SidebarXTheme(
        width: 250,
      ),
      headerBuilder: ((context, extended) {
        return const SizedBox(
          height: 100,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 60,
          ),
        );
      }),
      footerDivider: const Divider(
        color: Colors.white,
        height: 1,
      ),
      items: [
        const SidebarXItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
        ),
        SidebarXItem(
            icon: Icons.logout,
            label: 'Logout',
            onTap: () {
              if (Get.find<UserAuthController>().isUserLoggedIn()) {
                Get.find<UserAuthController>().logout();
                Get.toNamed("/");
              }
            }),
      ],
    );
  }
}
