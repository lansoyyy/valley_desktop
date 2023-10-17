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
            TextFieldWidget(
              width: 350,
              label: 'Course',
              controller: courseController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              width: 350,
              label: 'Section',
              controller: sectionController,
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              label: 'Register',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisteringScreen(
                        name: nameController.text,
                        idnumber: idnumberController.text,
                        course: courseController.text,
                        section: sectionController.text)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
