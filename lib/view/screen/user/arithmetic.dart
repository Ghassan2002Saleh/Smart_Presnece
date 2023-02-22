import 'package:flutter/material.dart';

class ArithmeticPage extends StatefulWidget {
  const ArithmeticPage({super.key});

  @override
  State<ArithmeticPage> createState() => _ArithmeticPageState();
}

class _ArithmeticPageState extends State<ArithmeticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "الصفحة الرئيسية",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbzYi-opUwgHCbmFzGQ-ffnXfGknhvv72sKA&usqp=CAU"),
                                fit: BoxFit.fill)),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: const [
                          Text(
                            "اسم المستخدم",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "غسان صالح",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: const [
                          Text(
                            "الايميل",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "ghsansalh47@gmail.com",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: const [
                          Text(
                            "الكلية",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "كلية الهندسة وتكنولوجيا المعلومات",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
