import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_work/src/view/loginScreen/bloc.dart';
import 'package:test_work/src/view/loginScreen/event.dart';
import 'package:test_work/src/view/loginScreen/state.dart';
import 'package:test_work/src/view/userListScreen/bloc.dart';
import 'package:test_work/src/view/userListScreen/user_list_screen_view.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenViewState();
  }
}

class LoginScreenViewState extends State<LoginScreenView> {
  late final TextEditingController _controller;
  bool errorIsShow = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return initView(context);
  }

  Widget initView(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(buildWhen: (prev, current) {
      if (current is UserLoginFailure) {
        return true;
      } else if (current is UserLoginSuccess) {
        return true;
      } else {
        return true;
      }
    }, listener: (context, state) {
      if (state is UserLoginSuccess) {
        errorIsShow = false;
        pushWithData(context);
      } else if (state is UserLoginFailure) {
        errorIsShow = true;
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Авторизация",
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10, right: 10, top: 100, bottom: 100),
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLength: 30,
                    controller: _controller,
                    decoration:
                        const InputDecoration(hintText: "Введите логин"),
                  ),
                  Text(errorIsShow ? "Ошибка логина" : ""),
                  ElevatedButton(
                      onPressed: () => pressLoginButton(context),
                      child: const Text("Войти"))
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.white),
                  color: Colors.white54),
            ),
          ),
        ),
      );
    });
  }

  void pressLoginButton(BuildContext context) {
    context.read<LoginBloc>().add(LoginAuth(_controller.text));
  }

  void pushWithData(BuildContext _context) {
    var provider = BlocProvider(
      create: (_) => UserListBloc(),
      child: const UserListScreenView(),
    );
    Navigator.push(
        _context, MaterialPageRoute(builder: (_context) => provider));
  }
}
