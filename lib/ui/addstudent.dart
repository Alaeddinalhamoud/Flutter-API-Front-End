import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:studentapp/models/api.services.dart';
import 'package:studentapp/models/student.dart';

class AddStudent extends StatefulWidget {
  final Student student;
  AddStudent(this.student);

  @override
  State<StatefulWidget> createState() => _AddStudentState(student);
}

class _AddStudentState extends State<AddStudent> {
  Student student;
  _AddStudentState(this.student);
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  final options = const <String>['Save', 'Delete'];
  static const menuSave = 'Save';
  static const menuDelete = 'Delete';
  final _gendersDropDownList = ["Male", "Female", "NA"];
  String _genderDropDownList = "NA";
  var textStyle = TextStyle();

  @override
  Widget build(BuildContext context) {
    firstNameController.text = student.firstName;
    lastNameController.text = student.lastName;
    textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildForm(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Add Student"),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: selectOption,
          itemBuilder: (BuildContext context) {
            return options.map((String option) {
              return PopupMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList();
          },
        )
      ],
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            controller: firstNameController,
            style: textStyle,
            onChanged: (value)=> this.updateFirstName(),
            decoration: InputDecoration(
                labelText: "First Name",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: TextField(
              controller: lastNameController,
              style: textStyle,
              onChanged:  (value)=> this.updateLastName(),
              decoration: InputDecoration(
                  labelText: "Last Name",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
            ),
          ),
          ListTile(
              title: DropdownButton<String>(
            items: _gendersDropDownList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            style: textStyle,
            value: retrieveGender(student.gender),
            onChanged: (value) => updateGender(value),
          ))
        ],
      ),
    );
  }

  void updateGender(String value) {
    switch (value) {
      case "Male":
        student.gender = 1;
        break;
      case "Female":
        student.gender = 2;
        break;
      case "NA":
        student.gender = 3;
        break;
    }
    setState(() {
      _genderDropDownList = value;
    });
  }

void updateFirstName (){
  student.firstName=firstNameController.text;
}

void updateLastName (){
  student.lastName=lastNameController.text;
}


  String retrieveGender(int value) {
    return _gendersDropDownList[value - 1];
  }

  void selectOption(String value) async {
    switch (value) {
      case menuSave:
        saveStudent();
        break;
      case menuDelete:
        deleteStudent();
        break;
      default:
    }
  }

  void saveStudent() {
    print('save and back');     
    var tes=APIServices.postStudent(student);
    print('Post Data');
    print(tes);
    Navigator.pop(context, true);
  }

  void deleteStudent() {
    print('we are working one delete student');
  }
}
