import 'package:flutter/material.dart';
import 'package:smart_presence_app/model/list/list_page_view.dart';
import 'package:smart_presence_app/widget/custom_icon_button.dart';
import 'package:smart_presence_app/widget/custom_logo.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'existing_user.dart';

class BottomNavigationBarUser extends StatefulWidget {
  const BottomNavigationBarUser({super.key});

  @override
  State<BottomNavigationBarUser> createState() =>
      _BottomNavigationBarUserState();
}

class _BottomNavigationBarUserState extends State<BottomNavigationBarUser> {
  late int _currentIndex = 0;

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
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const ExistingPage();
                },
              ));
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
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 400),
        index: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            Icons.speaker_notes,
            size: 30,
          ),
          Icon(
            Icons.person,
            size: 30,
          ),
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        color: Theme.of(context).primaryColor,
        // buttonBackgroundColor: Colors.purple,
      ),
    );
  }
}
