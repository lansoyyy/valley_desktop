import 'package:flutter/material.dart';
import 'package:valley_desktop/screens/register_screen.dart';
import 'package:valley_desktop/screens/scan_screen.dart';
import 'package:valley_desktop/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterScreen()));
              },
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.app_registration,
                        color: Colors.blue,
                        size: 75,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextBold(
                        text: 'Register NFC',
                        fontSize: 24,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScanScreen()));
              },
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.qr_code_scanner_sharp,
                        color: Colors.blue,
                        size: 75,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextBold(
                        text: 'Scan NFC',
                        fontSize: 24,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
