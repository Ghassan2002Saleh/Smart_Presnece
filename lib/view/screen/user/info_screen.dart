import 'package:flutter/material.dart';
import 'package:smart_presence_app/model/list/list_info.dart';
import 'package:smart_presence_app/widget/button.dart';
import 'package:smart_presence_app/widget/dot_indicator.dart';
import 'package:smart_presence_app/widget/onbord_content.dart';

import 'login_user.dart';
import '../admin/signup.dart';

class AnimationScrol extends StatefulWidget {
  const AnimationScrol({Key? key}) : super(key: key);

  @override
  State<AnimationScrol> createState() => _AnimationScrolState();
}

class _AnimationScrolState extends State<AnimationScrol> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: PageView.builder(
                  itemCount: dome_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnbordContent(
                    image: dome_data[index].image,
                    title: dome_data[index].title,
                    sup: dome_data[index].sup,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        dome_data.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child:
                                  DotIndicator(isActive: index == _pageIndex),
                            )),
                  ],
                ),
              ),
              const Spacer(),
              AnimatedCrossFade(
                firstChild: Column(
                  children: [
                    Button(
                      function: () {
                        _pageController.nextPage(
                          duration: const Duration(microseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      text: "التالي",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: InkWell(
                        child: Text(
                          "تخطى",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Theme.of(context).primaryColor),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginUser(),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
                secondChild: Column(
                  children: [
                    Button(
                      function: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginUser(),
                            ));
                      },
                      text: "تسجيل الدخول",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(
                      function: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const SignUpPage();
                          },
                        ));
                      },
                      text: "تسجيل",
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                crossFadeState: _pageIndex == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
              )
            ],
          ),
        )));
  }
}
