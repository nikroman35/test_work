import 'dart:math';

class RandomUserName {
  String? title;
  String? first;
  String? last;

  RandomUserName({this.title, this.first, this.last});

  RandomUserName.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }
}

class DateOfBirthday {
  String? date;
  int? age;

  DateOfBirthday({this.date, this.age});

  DateOfBirthday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }
}

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }
}

class RandomUser {
  RandomUserName? name;
  String? phone;
  DateOfBirthday? dob;
  Picture? picture;
  String? gender;

  RandomUser({this.name,
    this.phone,
    this.dob,
    this.picture,
    this.gender});

  RandomUser.fromJson(Map<String, dynamic> json) {
    name = RandomUserName.fromJson(json['name']);
    phone = json['phone'];
    dob = DateOfBirthday.fromJson(json['dob']);
    picture = Picture.fromJson(json['picture']);
    gender = json['gender'];
  }

  @override
  String toString() {
    return 'RandomUser{name: $name, phone: $phone, dob: $dob, picture: $picture, gender: $gender}';
  }
}