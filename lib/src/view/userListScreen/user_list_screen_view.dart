import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/src/view/userListScreen/bloc.dart';
import 'package:test_work/src/view/userListScreen/state.dart';

class UserListScreenView extends StatefulWidget {
  const UserListScreenView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserListScreenViewState();
  }
}

class UserListScreenViewState extends State<UserListScreenView> {

  @override
  Widget build(BuildContext context) {
    return initView(context);
  }

  Widget initView(BuildContext context) {
    return BlocConsumer<UserListBloc, UserListState>(
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
        return Scaffold(
          appBar: customAppBar(state.localuser),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator (
                    onRefresh: () => pullToRefresh(),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListItem(state.users[index].name?.title ?? "");
                      },
                      itemCount: state.users.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Container();
        // printError
      }
    });
  }

  PreferredSizeWidget customAppBar(String text) {
    var appBar = AppBar(
      title: Text(text, textAlign: TextAlign.center,),
      leading: GestureDetector(
        onTap: logoutButtonTap,
        child: const Icon(Icons.logout), // Listner
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: searchButtonTap,
            child: const Icon(Icons.search),
          ),
        )
      ],
    );
    return appBar;
  }


  void searchButtonTap() {}

  void logoutButtonTap() {}

  Future<void> pullToRefresh() async {
    setState(() {
      print("refresh");
    });
  }
}

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(double.infinity);

  @override
  Widget build(BuildContext context) {
    return TextField();
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
