import 'package:test_work/src/models/user.dart';
import 'package:test_work/src/models/users_presentation.dart';

extension RandomUserExtension on RandomUser {
  UserPresentationOnList mapToListUser() {
    var user = UserPresentationOnList(
        picturePath: picture?.medium ?? "",
        name: UserPresentationOnListName(
            first: name?.first ?? "", last: name?.last ?? ""),
        userID: (userID?.name ?? "") + (userID?.value ?? ""));
    return user;
  }

  UserPresentationOnDetail mapToDetailUser() {
    var user = UserPresentationOnDetail(
        name: UserPresentationOnDetailName(
            title: name?.title ?? "",
            first: name?.first ?? "",
            last: name?.last ?? ""),
        location: UserPresentationLocation(
          street: UserPresentationStreet(
              number: location?.street?.number ?? 0,
              name: location?.street?.name ?? ""),
          city: location?.city ?? "",
          state: location?.state ?? "",
          country: location?.country ?? "",
          coordinates: UserPresentationCoordinates(
              latitude: location?.coordinates?.latitude ?? "",
              longitude: location?.coordinates?.longitude ?? ""),
        ),
        dob: UserPresentationDateOfBirthday(
            date: dob?.date?.substring(0, 10) ?? "", age: dob?.age ?? 0),
        phone: phone ?? "",
        picturePath: picture?.large ?? "",
        userID: (userID?.name ?? "") + (userID?.value ?? ""));
    return user;
  }
}
