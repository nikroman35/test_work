import 'package:test_work/src/models/users_presentation.dart';

abstract class UserDetailState {}

class UserDetailLoading extends UserDetailState {
  final UserPresentationOnDetail user;
  UserDetailLoading(this.user);
}

