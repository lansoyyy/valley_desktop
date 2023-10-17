import 'package:flutter/material.dart';
import 'package:valley_desktop/screens/scanning_screen.dart';
import 'package:valley_desktop/widgets/button_widget.dart';
import 'package:valley_desktop/widgets/text_widget.dart';
import 'package:valley_desktop/widgets/textfield_widget.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final labController = TextEditingController();
  final computernumberController = TextEditingController();

  String selected = 'Time In';

  List<String> type1 = [
    'Time In',
    'Time Out',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextRegular(text: 'Scan NFC', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              width: 350,
              label: 'Laboratory Name',
              controller: labController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              width: 350,
              label: 'Computer Number',
              controller: computernumberController,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextRegular(
                  text: 'Attendance Type',
                  fontSize: 14,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: selected,
                    items: type1.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Center(
                          child: SizedBox(
                            width: 325,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                item,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'QRegular',
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selected = newValue.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              label: 'Continue',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScanningScreen(
                        labname: labController.text,
                        computernumber: computernumberController.text,
                        attendancetype: selected)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
