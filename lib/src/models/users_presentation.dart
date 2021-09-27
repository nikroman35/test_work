
class UserPresentationOnList {
  String? picturePath;
  UserPresentationOnListName? name;
}

class UserPresentationOnListName {
  String? first;
  String? last;
}

class UserPresentationOnDetailName {
  String? title;
  String? first;
  String? last;
}

class  UserPresentationDateOfBirthday {
  String? date;
  int? age;
}

class UserPresentationLocation {
  UserPresentationStreet? street;
  String? city;
  String? state;
  String? country;
  UserPresentationCoordinates? coordinates;
}

class UserPresentationStreet {
  int? number;
  String? name;
}

class UserPresentationCoordinates {
  String? latitude;
  String? longitude;
}

class UserPresentationOnDetail {
  UserPresentationOnDetailName? name;
  UserPresentationLocation? location;
  UserPresentationDateOfBirthday? dob;
  String? phone;
  String? picturePath;
}