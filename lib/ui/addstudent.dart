 import 'package:flutter/material.dart';

 class AddStudent extends StatefulWidget {
   
  AddStudent({Key key}) : super(key: key);

  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
       body: Center(
         child: Column(
           children: <Widget>[
             Text("TEst")
           ],
         ),
       ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Add Student"),
    );
  }

}