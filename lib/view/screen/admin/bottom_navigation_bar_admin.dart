import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/custom_icon_button.dart';
import '../../../widget/custom_logo.dart';

class BottomNavigationBarAdmin extends StatefulWidget {
  const BottomNavigationBarAdmin({super.key});

  @override
  State<BottomNavigationBarAdmin> createState() =>
      _BottomNavigationBarAdminState();
}

class _BottomNavigationBarAdminState extends State<BottomNavigationBarAdmin> {
  int _currentIndex = 0;
  List<Widget> body = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        elevation: 0.0,
        centerTitle: true,
        leading: CustomIconButton(
            icon: Icons.toc_outlined,
            color: Theme.of(context).primaryColor,
            function: () {
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return const ExistingPage();
              //   },
              // ));
            }),
        title: const CustomLogo(),
        actions: [
          CustomIconButton(
            icon: Icons.notifications_active_outlined,
            function: () {},
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: "home".tr,
            activeIcon: const Icon(
              Icons.home,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.speaker_notes),
            label: "vacation".tr,
            activeIcon: const Icon(
              Icons.speaker_notes,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.speaker_notes),
            label: "vacation".tr,
            activeIcon: const Icon(
              Icons.group_outlined,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: "arithmetic".tr,
            activeIcon: const Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.green[600],
        selectedItemColor: Theme.of(context).backgroundColor,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
