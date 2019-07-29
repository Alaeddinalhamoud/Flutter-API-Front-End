import 'package:studentapp/models/student.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class APIServices {
  static Future fetchStudents() async {
    return await http.get('http://192.168.0.10:5005/api/Student');
  }
}
