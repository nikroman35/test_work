
import 'dart:developer';
import 'package:test_work/src/models/user.dart';
import 'package:test_work/src/service/network/client.dart';

class ResultAPI {
  final List<RandomUser> users;
  final Error? error;

  ResultAPI(this.users, this.error);

}

class RandomUserAPI {

  Future<ResultAPI> getUsers() async {
    try {
      final client = NetworkClient.getClient();
      final response = await client.get(
        "",
        queryParameters: {"results": 15},
      );
      var data = response.data as Map<String, dynamic>;
      var resultList = data['results'] as List;
      List<RandomUser> resultUsersList = [];
      for (var dataElement in resultList) {
        resultUsersList.add(RandomUser.fromJson(dataElement));
      }
      var result = ResultAPI(resultUsersList, null);
      return result;
    }
    catch(error) {
      var result = ResultAPI([], error as Error);
      return result;
    }
  }


}