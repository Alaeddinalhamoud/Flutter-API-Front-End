import 'package:studentapp/models/student.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class APIServices {

  static Future fetchStudents() async {
    return await http.get('http://192.168.0.7:5005/api/Student');
  }

  static Future postStudent(Student student) async {

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    }; 
    var myStudent = student.toJson();
    var studentBody = json.encode(myStudent);
    var res = await http.post('http://192.168.0.7:5005/api/Student', headers: header, body: studentBody);
    print(res.statusCode);
    return res.statusCode;
  }
}
