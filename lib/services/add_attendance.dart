import 'package:cloud_firestore/cloud_firestore.dart';

Future addAttendance(name, idnumber, section, course, attendancetype, labname,
    computername) async {
  final docUser = FirebaseFirestore.instance.collection('Attendance').doc();

  final json = {
    'name': name,
    'idnumber': idnumber,
    'section': section,
    'course': course,
    'attendancetype': attendancetype,
    'labname': labname,
    'dateTime': DateTime.now(),
    'computername': computername
  };

  await docUser.set(json);
}
