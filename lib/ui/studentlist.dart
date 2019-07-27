import 'dart:async';
import 'package:flutter/material.dart';
class StudentList extends StatefulWidget {
  StudentList({Key key}) : super(key: key);
  

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
   

   

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


}
