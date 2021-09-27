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

class Location {
  Street? street;
  String? city;
  String? state;
  String? country;
  //int? postcode;
  Coordinates? coordinates;

  Location({this.street,
    this.city,
    this.state,
    this.country,
    //this.postcode,
    this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    street = Street.fromJson(json['street']);
    city = json['city'];
    state = json['state'];
    country = json['country'];
    //postcode = json['postcode'];
    coordinates = Coordinates.fromJson(json['coordinates']);
  }
}

class Street {
  int? number;
  String? name;

  Street({this.number, this.name});

  Street.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
  }
}

class Coordinates {
  String? latitude;
  String? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
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
  Location? location;

  RandomUser({this.name,
    this.phone,
      this.dob,
      this.picture,
      this.gender,
      this.location});

  RandomUser.fromJson(Map<String, dynamic> json) {
    name = RandomUserName.fromJson(json['name']);
    phone = json['phone'];
    dob = DateOfBirthday.fromJson(json['dob']);
    picture = Picture.fromJson(json['picture']);
    gender = json['gender'];
    location = Location.fromJson(json['location']);
  }

  @override
  String toString() {
    return 'RandomUser{name: $name, phone: $phone, dob: $dob, picture: $picture, gender: $gender, location: $location}';
  }
}