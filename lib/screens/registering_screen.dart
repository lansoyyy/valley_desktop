import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/record.dart';
import 'package:valley_desktop/screens/home_screen.dart';
import 'package:valley_desktop/widgets/button_widget.dart';
import 'package:valley_desktop/widgets/text_widget.dart';
import 'package:valley_desktop/widgets/toast_widget.dart';

class RegisteringScreen extends StatefulWidget {
  String name;
  String idnumber;
  String course;
  String section;

  RegisteringScreen(
      {super.key,
      required this.name,
      required this.idnumber,
      required this.course,
      required this.section});

  @override
  State<RegisteringScreen> createState() => _RegisteringScreenState();
}

class _RegisteringScreenState extends State<RegisteringScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.nfc,
                  color: Colors.blue,
                  size: 250,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                  text: 'Put now the NFC',
                  fontSize: 14,
                  color: Colors.blue,
                ),
                const SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                  label: 'Register',
                  onPressed: () async {
                    var tag = await FlutterNfcKit.poll(
                        timeout: const Duration(seconds: 10));
                    var availability = await FlutterNfcKit.nfcAvailability;

                    if (tag.ndefWritable == true) {
                      if (availability != NFCAvailability.available) {
                        showToast('No NFC detected');
                      } else {
                        try {
                          final customRecord = NDEFRawRecord(
                            "student",
                            "${widget.name},${widget.idnumber},${widget.course},${widget.section}",
                            "student_data",
                            TypeNameFormat.unknown,
                          );

                          await FlutterNfcKit.writeNDEFRawRecords(
                              [customRecord]).then((value) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => const HomeScreen()))
                                .then(
                              (value) {
                                showToast('Student registered succesfully!');
                              },
                            );
                          });

                          // Handle success
                        } catch (e) {
                          showToast(e);
                          // Handle error
                        }
                      }
                    } else {
                      showToast('NFC Tag not writable');
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
