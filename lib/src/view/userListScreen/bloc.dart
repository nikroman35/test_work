import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/src/service/network/api.dart';
import 'package:test_work/src/service/storage/user_storage.dart';
import 'package:test_work/src/view/userListScreen/event.dart';
import 'package:test_work/src/view/userListScreen/state.dart';

class UserListBlock extends Bloc<UserListEvent, UserListState> {
  UserListBlock() : super(UserListLoading()) {
    add(UserListInit());
  }

  @override
  Stream<UserListState> mapEventToState(UserListEvent event) async* {
    if (event is UserListInit) {
      yield* updateData();
    } else if (event is UserLogout) {
      yield* userLogout();
    } else if (event is UserListSearch) {
      yield* search();
    }
  }

  Stream<UserListState> userLogout() async* {
    var userStorage = UserStorage();
    userStorage.userName = null;
    var localUserData = userStorage.userName;
    if (localUserData == null) {
      yield UserLogoutSuccess();
    }
    else {
      yield UserLogoutFailure();
    }
  }

  Stream<UserListState> search() async* {
    print("search");
  }

  Stream<UserListState> updateData() async* {
    yield UserListLoading();
    var usersData = await RandomUserAPI().getUsers();
    print(usersData);
    yield UserListSuccess(usersData);
  }
}