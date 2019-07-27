import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studentapp/models/student.dart';


class StudentList extends StatefulWidget {
  StudentList({Key key}) : super(key: key);
  

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
   

@override
void initState(){
  super.initState();
  _fetchStudents();
}

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: _buildAppBar(context),

    );
  }

Widget _buildAppBar(BuildContext context){
  return AppBar(
    title: Text("Student APP"),
  ) ;
}


Future<Student> _fetchStudents() async{
    final response= await
    http.get('http://192.168.0.10:5005/api/Student/1');
    if(response.statusCode==200){
      print(response.body);
      var data= Student.fromJson(json.decode(response.body));
      print(data.dob);
      return data;
    }else{
      throw Exception('Failed to load the student...');
    }
}

}
