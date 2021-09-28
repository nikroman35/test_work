import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/src/models/users_presentation.dart';
import 'package:test_work/src/view/userDetailScreen/block.dart';
import 'package:test_work/src/view/userDetailScreen/state.dart';
import 'package:intl/intl.dart';

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
            var user = state.user;
            var age = user.dob.age;
            var date = convertDateToFormat(user.dob.date);
            var address = convertLocationToFormat(user.location.street,
                user.location.city, user.location.state, user.location.country);
            var number = user.phone;
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  state.user.name.first,
                  textAlign: TextAlign.center,
                ),
              ),
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ClipOval(
                      child: Image.network(state.user.picturePath),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      const Text(
                        "Name  : ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Center(
                          child: Text(state.user.name.first,
                              style: const TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.italic))),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(state.user.name.last,
                          style: const TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic)),
                    ], mainAxisAlignment: MainAxisAlignment.center),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Age : $age", style: const TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Date of birthday : $date",
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Location : $address",
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Phone : $number",
                        style: const TextStyle(fontSize: 18))
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

  String convertDateToFormat(String date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var format = DateFormat('yyyy/MM/dd').format(inputDate);
    return format;
  }

  String convertLocationToFormat(UserPresentationStreet street, String city,
      String state, String country) {
    var text = country +
        "\n" +
        state +
        "\n" +
        city +
        "\n" +
        street.name +
        " " +
        street.number.toString();
    return text;
  }
}
