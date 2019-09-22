import 'package:studentapp/models/student.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class APIServices {
  static String studentsUrl='http://192.168.0.8:5005/api/Student/';
  
  static Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    }; 

  
  static Future fetchStudents() async {
    return await http.get(studentsUrl);
  }
static Future deleteStudent(int id) async{
  return await http.delete(studentsUrl+id.toString(), headers: header);
}
  static Future postStudent(Student student) async {  
    var myStudent = student.toMap();
    var studentBody = json.encode(myStudent);
    var res = await http.post(studentsUrl, headers: header, body: studentBody);
    print(res.statusCode);
    return res.statusCode;
  }



}
