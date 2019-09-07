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
  final choices=const <String>['Save',  'Delete'];
  final String menuSave='Save';
  final String menuDelete='Delete';
  final _gendersDropDownList = ["Male", "Female", "NA"];
  String _genderDropDownList = "NA";
  var textStyle=TextStyle();

  @override
  Widget build(BuildContext context) {
    firstNameController.text=student.firstName;
    lastNameController.text=student.lastName;
    textStyle=Theme.of(context).textTheme.title;
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
          onSelected: null,
          itemBuilder: (BuildContext context){
            return choices.map((String choice){
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        )
      ],
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.only(top: 35.0,left: 10.0,right: 10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            controller: firstNameController,
            style:textStyle,
            onChanged: null,
            decoration: InputDecoration(
              labelText: "First Name",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),                
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
            child: TextField(
              controller: lastNameController,
              style: textStyle,
              onChanged: null,
              decoration: InputDecoration(
                labelText: "Last Name",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
              ),
            ),
          ),
          ListTile(title: DropdownButton<String>(
            items: _gendersDropDownList.map((String value){
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
              );
            }).toList(),
            style: textStyle,
            value:retrieveGender(student.gender),
            onChanged: (value)=>setGender(value),             
            ))          
        ],
      ), 
    ) ;
  }


 void setGender(String value) {  
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
          _genderDropDownList=value;
        });
  }

  String  retrieveGender(int value){
    return _gendersDropDownList[value-1];
  }



}
