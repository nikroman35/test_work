import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/src/service/storage/user_storage.dart';
import 'package:test_work/src/view/loginScreen/event.dart';
import 'package:test_work/src/view/loginScreen/state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(UserLoginSuccess()) {
    add(LoginInit());
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginAuth) {
      yield* authUser(event.nameString);
    } else if (event is LoginInit) {
      yield* checkUser();
    }
  }

  Stream<LoginState> checkUser() async* {
    var userStorage = UserStorage();
    await userStorage.openBox();
    if (userStorage.userName != null && userStorage.userName != "") {
      yield UserLoginSuccess();
    }
  }

  Stream<LoginState> authUser(String login) async* {
    var userStorage = UserStorage();
    await userStorage.openBox();
    userStorage.userName = login;
    var checkLogin = userStorage.userName;
    if (checkLogin != null && checkLogin != "") {
      yield UserLoginSuccess();
    }
   else {
      yield UserLoginFailure();
    }
  }

}