import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/src/service/network/api.dart';
import 'package:test_work/src/service/storage/user_storage.dart';
import 'package:test_work/src/view/loginScreen/bloc.dart';
import 'package:test_work/src/view/loginScreen/login_screen_view.dart';
import 'package:test_work/src/view/userListScreen/bloc.dart';
import 'package:test_work/src/view/userListScreen/user_list_screen_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

void main() async {
  await setupStorage();
  runApp(const SampleApp());
}

Future setupStorage() async {
  await Hive.initFlutter();
  var userStorage = UserStorage();
  await userStorage.openBox();
}

class SampleApp extends StatelessWidget {

  const SampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => LoginBloc(),
        child: const LoginScreenView(),
      ),
    );
  }
}


