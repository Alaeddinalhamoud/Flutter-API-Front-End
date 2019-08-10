import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:studentapp/models/api.services.dart';
import 'package:studentapp/models/student.dart';
import 'package:studentapp/ui/addstudent.dart';

class StudentList extends StatefulWidget {
  StudentList({Key key}) : super(key: key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  var students = new List<Student>();

  _getStudents() {
    APIServices.fetchStudents().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        students = list.map((model) => Student.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();  
    _getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:_buidFloatingButton() ,
      appBar: _buildAppBar(context),
      body: students == null
          ? Center(child: Text('Empty'))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(students[index].firstName),
                );
              },
            ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Student APP"),
    );
  }

  Widget _buidFloatingButton() {
    return FloatingActionButton(
        child:Icon(Icons.person_add) ,
        onPressed: (){
            //Call new ui to add student.
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStudent()));
        },
      );
  }
  
}
