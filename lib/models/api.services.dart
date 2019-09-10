import 'package:studentapp/models/student.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class APIServices {
  static String getStudentsUrl='http://192.168.0.8:5005/api/Student';
  static String postStudenttUrl='http://192.168.0.8:5005/api/Student';

  
  static Future fetchStudents() async {
    return await http.get(getStudentsUrl);
  }

  static Future postStudent(Student student) async {

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    }; 
    var myStudent = student.toMap();
    var studentBody = json.encode(myStudent);
    var res = await http.post(postStudenttUrl, headers: header, body: studentBody);
    print(res.statusCode);
    return res.statusCode;
  }
}
