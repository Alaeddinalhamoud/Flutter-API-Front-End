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
  List<Student> students;

  getStudents() {
    APIServices.fetchStudents().then((response) {
      Iterable list = json.decode(response.body);
      List<Student> studentList = List<Student>();
      studentList = list.map((model) => Student.fromObject(model)).toList();
      setState(() {
        students = studentList;
      });
    });
  }

 // @override
 // void initState() {
 //   super.initState();
 //   getStudents();
 // }

  @override
  Widget build(BuildContext context) {
    if (students == null) {
      students = List<Student>();
      getStudents();
    }
    return Scaffold(
      floatingActionButton: _buidFloatingButton(),
      appBar: _buildAppBar(context),
      body: students == null
          ? Center(child: Text('Empty'))
          : _studentsListItems(),
    );
  }

  ListView _studentsListItems() {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return ListTile(
          title:
              Text(students[index].firstName + " " + students[index].lastName),
          onTap: () {
            navigateToStudent(this.students[index]);
          },
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Student APP"),
    );
  }

  Widget _buidFloatingButton() {
    return FloatingActionButton(
      child: Icon(Icons.person_add),
      onPressed: () {
        //Call new ui to add student.
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddStudent(Student('', '', 1))));
      },
    );
  }

  void navigateToStudent(Student student) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddStudent(student)),
    );
    if (result == true) {
      getStudents();
    }
  }
}
