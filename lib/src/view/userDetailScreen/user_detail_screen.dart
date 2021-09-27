import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/src/view/userDetailScreen/block.dart';
import 'package:test_work/src/view/userDetailScreen/state.dart';

class UserDetailScreenView extends StatefulWidget {
  const UserDetailScreenView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserDetailScreenViewState();
  }
}

class UserDetailScreenViewState extends State<UserDetailScreenView> {

  @override
  Widget build(BuildContext context) {
    return initView(context);
  }

  Widget initView(BuildContext context) {
    return BlocConsumer<UserDetailBloc, UserDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UserDetailLoading) {
            return Scaffold(
              appBar: AppBar(title: Text("kek",  textAlign: TextAlign.center,),),
              body: SafeArea(
                child: Column(),
              ),
            );
          } else {
            return Container();
            // printError
          }
        });
  }

  Future<void> pullToRefresh() async {
    setState(() {
      print("refresh");
    });
  }
}

