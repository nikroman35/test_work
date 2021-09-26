
import 'dart:developer';
import 'package:test_work/src/models/user.dart';
import 'package:test_work/src/service/network/client.dart';

class RandomUserAPI {

  Future<List<RandomUser>> getUsers() async {
    try {
      final client = NetworkClient.getClient();
      final response = await client.get(
        "",
        queryParameters: {"results": 15},
      );
      var data = response.data as Map<String, dynamic>;
      var resultList = data['results'] as List;
      List<RandomUser> result = [];
      for (var dataElement in resultList) {
        result.add(RandomUser.fromJson(dataElement));
      }
      return result;
    }
    catch(error) {
      print(error);
      return [];
    }
  }


}