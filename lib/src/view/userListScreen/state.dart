import 'package:test_work/src/models/user.dart';
import 'package:test_work/src/models/users_presentation.dart';

abstract class UserListState {}

class UserListLoading extends UserListState {}

class UserLogoutSuccess extends UserListState {}
class UserLogoutFailure extends UserListState {}
class UserOnPush extends UserListState {
  final UserPresentationOnDetail userList;

  UserOnPush(this.userList);
}

class UserListSuccess extends UserListState {
  final List<UserPresentationOnList> users;
  final String localUser;

  UserListSuccess(this.users, this.localUser);
}

