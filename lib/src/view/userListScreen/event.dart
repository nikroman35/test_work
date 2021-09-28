import 'package:test_work/src/models/users_presentation.dart';

abstract class UserListEvent {}

class UserListSearch extends UserListEvent {
  String searchString;

  UserListSearch(this.searchString);
}

class UserLogout extends UserListEvent {}

class UserListInit extends UserListEvent {}

class UserListPush extends UserListEvent {
  UserPresentationOnListName user;

  UserListPush(this.user);

}
