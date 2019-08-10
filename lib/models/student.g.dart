// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String);
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dob': instance.dob,
      'gender': instance.gender
    };
