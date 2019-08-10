import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'student.g.dart';

@JsonSerializable()

class Student {
 // final int id;
  final String firstName;
  final String lastName;
  final String dob;
  final String gender;

  Student({ this.firstName, this.lastName, this.dob, this.gender});

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
     /* : firstName= json['firstName'],
        lastName= json['lastName'],
        dob= json['dob'],
        gender= json['gender'];  */


  Map<String, dynamic> toJson() => _$StudentToJson(this);
 /*   {
     // 'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'gender': gender
    };
  */



  

}
