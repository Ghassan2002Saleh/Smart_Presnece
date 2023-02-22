import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:smart_presence_app/widget/button.dart';
import 'bottom_navigation_bar_user.dart';

class FingerPrintPage extends StatefulWidget {
  const FingerPrintPage({super.key});

  @override
  State<FingerPrintPage> createState() => _FingerPrintPageState();
}

class _FingerPrintPageState extends State<FingerPrintPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: Column(
          children: [
            const Spacer(),
            const Center(
                child: Text(
              "البصمة",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 149, 117, 205)),
            )),
            const Spacer(),
            Image.asset(
              "images/fingerprint.png",
              color: Theme.of(context).primaryColor,
              height: 200,
              width: 150,
            ),
            const Text(
              "مصادقة البصمة",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 200,
              child: Text(
                "ادخل بصمتك لتسجيل الدخول لصفحة الرئيسية",
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            const SizedBox(),
            const Spacer(),
            Button(
                text: "دخول",
                function: () async {
                  final isAuthenticated = await LocalAuthApi.authenticate();

                  if (isAuthenticated) {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const BottomNavigationBarUser();
                      },
                    ));
                  }
                }),
            const Spacer()
          ],
        ),
      ),
    ));
  }
}

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<Object> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return BiometricType.fingerprint;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
          localizedReason: 'Scan Fingerprint to Authenticate',
          options: AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ));
    } on PlatformException catch (e) {
      return false;
    }
  }
}
