import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/src/models/users_presentation.dart';
import 'package:test_work/src/view/userDetailScreen/block.dart';
import 'package:test_work/src/view/userDetailScreen/user_detail_screen.dart';
import 'package:test_work/src/view/userListScreen/bloc.dart';
import 'package:test_work/src/view/userListScreen/event.dart';
import 'package:test_work/src/view/userListScreen/state.dart';

class UserListScreenView extends StatefulWidget {
  const UserListScreenView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserListScreenViewState();
  }
}

class UserListScreenViewState extends State<UserListScreenView> {
  late bool isSearch;

  @override
  void initState() {
    isSearch = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return initView(context);
  }

  Widget initView(BuildContext context) {
    return BlocConsumer<UserListBloc, UserListState>(
        buildWhen: (prev, current) {
      if (current is UserLogoutSuccess) {
        return false;
      } else if (current is UserLogoutFailure) {
        return false;
      } else if (current is UserOnPush) {
        return false;
      } else if (current is UserListLoading) {
        return true;
      } else {
        return true;
      }
    }, listener: (context, state) {
      if (state is UserLogoutSuccess) {
        popToLogin(context);
      } else if (state is UserOnPush) {
        pushWithData(state.userList, context);
      }
    }, builder: (context, state) {
      if (state is UserListLoading) {
        return Scaffold(
          appBar: customAppBar(""),
        );
      }
      if (state is UserListSuccess) {
        return Scaffold(
          appBar: isSearch
              ? customAppBar(state.localUser)
              : CustomSearchBar(
                  searchBarCancelTap: () => searchButtonCancel(context)),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => pullToRefresh(),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListItem(
                            state.users[index].name,
                            state.users[index].picturePath,
                            state.users[index].userID);
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

  void pushWithData(UserPresentationOnDetail data, BuildContext _context) {
    var provider = BlocProvider(
      create: (_) => UserDetailBloc(data),
      child: const UserDetailScreenView(),
    );
    Navigator.push(
        _context, MaterialPageRoute(builder: (_context) => provider));
  }

  void popToLogin(BuildContext _context) {
    Navigator.pop(_context);
  }

  PreferredSizeWidget customAppBar(String text) {
    var appBar = AppBar(
      title: Text(
        text,
        textAlign: TextAlign.center,
      ),
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

  void searchButtonTap() {
    setState(() {
      isSearch = !isSearch;
    });
  }

  void searchButtonCancel(BuildContext _context) {
    setState(() {
      isSearch = !isSearch;
      _context.read<UserListBloc>().add(UserListSearch(""));
    });
  }

  void logoutButtonTap() {
    context.read<UserListBloc>().add(UserLogout());
  }

  Future<void> pullToRefresh() async {
    context.read<UserListBloc>().add(UserListInit());
  }
}

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final Function() searchBarCancelTap;

  const CustomSearchBar({Key? key, required this.searchBarCancelTap})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(57);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 60),
              child: TextField(
                onChanged: (value) {
                  context.read<UserListBloc>().add(UserListSearch(value));
                },
                maxLength: 30,
                decoration: const InputDecoration(
                  hintText: "Имя пользователя",
                  counterText: "",
                ),
                cursorColor: Colors.black,
              ),
            ),
            width: MediaQuery.of(context).size.width - 50,
            height: double.infinity,
          ),
          IconButton(
            onPressed: searchBarCancelTap,
            icon: const Icon(
              Icons.cancel,
              size: 30,
            ),
          ),
        ],
      ),
      color: Colors.blue,
    );
  }
}

class ListItem extends StatelessWidget {
  final UserPresentationOnListName name;
  final String imagePath;
  final String userID;

  ListItem(this.name, this.imagePath, this.userID);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(imagePath),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  name.first,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          color: Colors.black12,
        ),
      ),
      onTap: () => tapListElement(context, name),
    );
  }

  void tapListElement(BuildContext context, UserPresentationOnListName userID) {
    context.read<UserListBloc>().add(UserListPush(userID));
  }
}
