import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/src/view/userListScreen/bloc.dart';
import 'package:test_work/src/view/userListScreen/state.dart';

class UserListScreenView extends StatelessWidget {
  const UserListScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<UserListBlock, UserListState>(
            listener: (context, state) {
          if (state is UserLogoutSuccess) {
            // LOGOUT
          } else if (state is UserLogoutFailure) {
            //print error
          }
        }, builder: (context, state) {
          if (state is UserListLoading) {
            return Container(
              color: Colors.red,
              width: 40,
              height: 50,
            );
          } else if (state is UserListSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: const Center(
                      child: Text(
                    "fluutter kal",
                    textAlign: TextAlign.center,
                  )),
                  height: 50,
                  color: Colors.amberAccent,
                  width: double.infinity,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListItem(state.users[index].name?.title ?? "");
                    },
                    itemCount: state.users.length,
                  ),
                ),
              ],
            );
          } else {
            return Container();
            // printError
          }
        }),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String name;

  ListItem(this.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Text(name), onTap: tapListElement,);
  }

  void tapListElement() {
    // push
  }

}
