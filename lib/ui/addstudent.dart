import 'dart:core';
import 'package:flutter/material.dart';
import 'package:studentapp/models/api.services.dart';
import 'package:studentapp/models/student.dart';

class AddStudent extends StatefulWidget {
  AddStudent({Key key}) : super(key: key);

  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var dobController = TextEditingController();
  var genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildForm(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Add Student"),
    );
  }

  Widget _buildForm() {
    return Padding(
        padding: EdgeInsets.all(20.0),        
        child: Form(
          key: _formKey,          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: firstNameController,
                validator: (val) {
                  if (val.isEmpty) {
                    return "First Name cannot be empty";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Enter your First Name',
                    icon: Icon(Icons.person_outline)),
              ),
              TextFormField(
                controller: lastNameController,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Last Name cannot be empty";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Enter your Last Name',
                    icon: Icon(Icons.person_outline)),
              ),
              TextFormField(
                controller: dobController,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Date of birth cannot be empty";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Enter your date of birth',
                    icon: Icon(Icons.calendar_today)),
              ),
              TextFormField(
                controller: genderController,
                validator: (val) {
                  if (val.isEmpty) {
                    return "Gender cannot be empty";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Enter your Gender', icon: Icon(Icons.people)),
              ),              
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                child: FlatButton.icon(
                  color: Colors.lightBlue,
                  label: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Student student = new Student(
                          firstName:firstNameController.text ,
                          lastName: lastNameController.text,
                          dob: dobController.text,
                          gender: genderController.text);
                      var tes=    APIServices.postStudent(student);
                      print(tes); 
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
