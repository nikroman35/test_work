abstract class UserListEvent {}

class UserListSearch extends UserListEvent {
  String searchString;

  UserListSearch(this.searchString);
}

class UserLogout extends UserListEvent {}

class UserListInit extends UserListEvent {}
