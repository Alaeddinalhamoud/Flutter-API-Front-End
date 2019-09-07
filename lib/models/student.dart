class Student {
  int _id;
  String _firstName;
  String _lastName;
  int _gender;

  Student(this._firstName, this._lastName, this._gender);
  Student.withId(this._id, this._firstName, this._lastName, this._gender);
  int get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  int get gender => _gender;

  set firstName(String newFirstName) {
    _firstName = newFirstName;
  } 

  set lastName(String newLastName) {
    _lastName = newLastName;
  }

  set gender(int newgender) {
    _gender = newgender;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["gender"] = _gender;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Student.fromObject(dynamic o) {
    this._id = o["id"];
    this._firstName = o["firstName"];
    this._lastName = o["lastName"];
    this._gender = o["gender"];
  }
}
