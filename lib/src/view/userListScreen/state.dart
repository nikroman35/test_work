import 'package:test_work/src/models/user.dart';

abstract class UserListState {}

class UserListLoading extends UserListState {}

class UserLogoutSuccess extends UserListState {}
class UserLogoutFailure extends UserListState {}

class UserListSuccess extends UserListState {
  final List<RandomUser> users;

  UserListSuccess(this.users);
}

