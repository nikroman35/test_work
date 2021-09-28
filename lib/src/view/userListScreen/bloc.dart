import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/src/models/users_presentation.dart';
import 'package:test_work/src/service/network/api.dart';
import 'package:test_work/src/service/storage/user_storage.dart';
import 'package:test_work/src/view/userListScreen/event.dart';
import 'package:test_work/src/view/userListScreen/state.dart';
import 'package:test_work/src/workers/network_worker.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(UserListLoading()) {
    add(UserListInit());
  }

  List<UserPresentation> userList = [];
  String? userName;

  @override
  Stream<UserListState> mapEventToState(UserListEvent event) async* {
    if (event is UserListInit) {
      yield* updateData();
    } else if (event is UserLogout) {
      yield* userLogout();
    } else if (event is UserListSearch) {
      yield* search(event.searchString);
    } else if (event is UserListPush) {
      yield* onDetail(event.user);
    }
  }

  Stream<UserListState> userLogout() async* {
    var userStorage = UserStorage();
    await userStorage.openBox();
    userStorage.userName = null;
    var localUserData = userStorage.userName;
    if (localUserData == null) {
      yield UserLogoutSuccess();
    }
    else {
      yield UserLogoutFailure();
    }
  }

  Stream<UserListState> onDetail(UserPresentationOnListName user) async* {
    var searchUsers = userList.map((e) {
      return e.detail;
    });
    var returnList = searchUsers.where((element) {
      return element.name.first
              .toLowerCase()
              .startsWith(user.first.toLowerCase()) &&
          element.name.last.toLowerCase().startsWith(user.last.toLowerCase());
    });

    yield UserOnPush(returnList.first);
  }

  Stream<UserListState> search(String text) async* {
    var searchUsers = userList.map((e) {
      return e.list;
    });
    var returnList = searchUsers.where((element) {
      return element.name.first.toLowerCase().startsWith(text.toLowerCase());
    });
    yield UserListSuccess(returnList.toList(), userName ?? "");
  }

  Stream<UserListState> updateData() async* {
    yield UserListLoading();
    userList = await NetworkWorker().getUsers();
    var userStorage = UserStorage();
    await userStorage.openBox();
    userName = userStorage.userName;
    if (userName != null) {
      yield UserListSuccess(
          userList.map((e) {
            return e.list;
          }).toList(),
          userName!);
    } else {
      yield UserLogoutSuccess();
    }
  }

}
