class Student{
  final int id;
  final String firstName;
  final String lastName;
  final String dob;
  final int gender;

  Student({this.id,this.firstName,this.lastName,this.dob,this.gender});

  factory Student.fromJson(Map<String,dynamic> json){
    return Student(
      id:json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dob: json['dob'],
      gender: json['gender']
    );
  }
}