import 'package:flutter/material.dart';
import 'package:valley_desktop/screens/registering_screen.dart';
import 'package:valley_desktop/widgets/button_widget.dart';
import 'package:valley_desktop/widgets/text_widget.dart';
import 'package:valley_desktop/widgets/textfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final courseController = TextEditingController();
  final sectionController = TextEditingController();
  final idnumberController = TextEditingController();

  String selectedCourse = 'BSCS';
  String selectedYear = '1';
  String selectedSection = 'A';

  Widget buildDropdown(String label, List<String> items, String selectedValue,
      ValueChanged onChanged) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            SizedBox(
              width: 350,
              child: DropdownButton<String>(
                value: selectedValue,
                onChanged: onChanged,
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextRegular(
            text: 'Register NFC', fontSize: 18, color: Colors.white),
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
              label: 'Name',
              controller: nameController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              width: 350,
              label: 'ID Number',
              controller: idnumberController,
            ),
            const SizedBox(
              height: 20,
            ),
            buildDropdown(
                "Course", ["BSCS", "BSIT", "BSIS", "BLIS"], selectedCourse,
                (value) {
              setState(() {
                selectedCourse = value;
              });
            }),
            const SizedBox(
              height: 20,
            ),
            buildDropdown("Section", ["A", "B", "C", "D"], selectedSection,
                (value) {
              setState(() {
                selectedSection = value;
              });
            }),
            const SizedBox(
              height: 20,
            ),
            buildDropdown("Year", ["1", "2", "3", "4"], selectedYear, (value) {
              setState(() {
                selectedYear = value;
              });
            }),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              label: 'Register',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisteringScreen(
                        year: selectedYear,
                        name: nameController.text,
                        idnumber: idnumberController.text,
                        course: selectedCourse,
                        section: selectedSection)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
