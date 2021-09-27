// Widget initView(BuildContext context) {
//   return Scaffold(
//     appBar: customAppBar("kek"),
//     body: SafeArea(
//       child: BlocConsumer<UserListBloc, UserListState>(
//           listener: (context, state) {
//             if (state is UserLogoutSuccess) {
//               // LOGOUT
//             } else if (state is UserLogoutFailure) {
//               //print error
//             }
//           }, builder: (context, state) {
//         if (state is UserListLoading) {
//           return Container(
//             color: Colors.red,
//             width: 40,
//             height: 50,
//           );
//         } else if (state is UserListSuccess) {
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemBuilder: (context, index) {
//                     return ListItem(state.users[index].name?.title ?? "");
//                   },
//                   itemCount: state.users.length,
//                 ),
//               ),
//             ],
//           );
//         } else {
//           return Container();
//           // printError
//         }
//       }),
//     ),
//   );
// }