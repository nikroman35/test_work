

import 'package:test_work/src/models/users_presentation.dart';
import 'package:test_work/src/service/mapping/user_mapper.dart';
import 'package:test_work/src/service/network/api.dart';

class NetworkWorker {

  Future<List<UserPresentation>> getUsers() async {
    var response = await RandomUserAPI().getUsers();
    if (response.error == null) {
      var users = response.users;
      return users.map((e) {
        var listUser = e.mapToListUser();
        var detailUser = e.mapToDetailUser();
        var user = UserPresentation(list: listUser, detail: detailUser);
        return user;
      }).toList();
    }
    else {
      return [];
    }
  }
}