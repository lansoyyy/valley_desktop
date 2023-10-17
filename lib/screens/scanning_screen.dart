import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:valley_desktop/services/add_attendance.dart';
import 'package:valley_desktop/widgets/text_widget.dart';

import '../widgets/button_widget.dart';
import '../widgets/toast_widget.dart';
import 'home_screen.dart';

class ScanningScreen extends StatefulWidget {
  String labname;
  String computernumber;
  String attendancetype;

  ScanningScreen(
      {super.key,
      required this.labname,
      required this.computernumber,
      required this.attendancetype});

  @override
  State<ScanningScreen> createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> {
  String name = '';
  String idnumber = '';
  String course = '';
  String section = '';
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
                  Icons.qr_code_scanner_sharp,
                  color: Colors.blue,
                  size: 250,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextBold(
                  text: 'Scan now the NFC',
                  fontSize: 14,
                  color: Colors.blue,
                ),
                const SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                  label: 'Continue',
                  onPressed: () async {
                    var tag = await FlutterNfcKit.poll(
                        timeout: const Duration(seconds: 10));
                    var availability = await FlutterNfcKit.nfcAvailability;

                    if (tag.ndefAvailable == true) {
                      if (availability != NFCAvailability.available) {
                        showToast('No NFC detected');
                      } else {
                        try {
                          for (var record
                              in await FlutterNfcKit.readNDEFRawRecords(
                                  cached: false)) {
                            setState(() {
                              name = jsonEncode(record).split(',')[0];
                              idnumber = jsonEncode(record).split(',')[1];
                              course = jsonEncode(record).split(',')[2];
                              section = jsonEncode(record).split(',')[3];
                            });
                          }

                          // Add Atttendance
                          addAttendance(
                              name,
                              idnumber,
                              section,
                              course,
                              widget.attendancetype,
                              widget.labname,
                              widget.computernumber);

                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const HomeScreen()))
                              .then(
                            (value) {
                              showToast('Attendance Recorded!');
                            },
                          );
                        } catch (e) {
                          showToast(e);
                        }
                      }
                    } else {
                      showToast('NFC Tag not available');
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
