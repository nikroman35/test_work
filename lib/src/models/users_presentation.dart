
class UserPresentation {
  UserPresentationOnList list;
  UserPresentationOnDetail detail;

  UserPresentation({required this.list, required this.detail});
}

class UserPresentationOnList {
  String picturePath;
  UserPresentationOnListName name;
  String userID;

  UserPresentationOnList({required this.picturePath, required this.name, required this.userID});
}

class UserPresentationOnListName {
  String first;
  String last;

  UserPresentationOnListName({required this.first, required this.last});
}

class UserPresentationOnDetailName {
  String title;
  String first;
  String last;

  UserPresentationOnDetailName({required this.title, required this.first, required this.last});
}

class  UserPresentationDateOfBirthday {
  String date;
  int age;

  UserPresentationDateOfBirthday({required this.date, required this.age});
}

class UserPresentationLocation {
  UserPresentationStreet street;
  String city;
  String state;
  String country;
  UserPresentationCoordinates coordinates;

  UserPresentationLocation({
    required this.street, required this.city, required this.state, required this.country, required this.coordinates});
}

class UserPresentationStreet {
  int number;
  String name;

  UserPresentationStreet({required this.number, required this.name});
}

class UserPresentationCoordinates {
  String latitude;
  String longitude;

  UserPresentationCoordinates({required this.latitude, required this.longitude});
}

class UserPresentationOnDetail {
  UserPresentationOnDetailName name;
  UserPresentationLocation location;
  UserPresentationDateOfBirthday dob;
  String phone;
  String picturePath;
  String userID;

  UserPresentationOnDetail({
    required this.name, required this.location, required this.dob, required this.phone, required this.picturePath, required this.userID});
}