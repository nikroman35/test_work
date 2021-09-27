import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/src/models/users_presentation.dart';
import 'package:test_work/src/view/userDetailScreen/event.dart';
import 'package:test_work/src/view/userDetailScreen/state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc(UserDetailState initialState) : super(initialState);

  @override
  Stream<UserDetailState> mapEventToState(UserDetailEvent event) async* {
    if (event is UserDetailInit) {
      yield* initData();
    } else {
      // yield* error();
    }
  }

  Stream<UserDetailState> initData() async* {
    var userData = UserPresentationOnDetail();
    yield UserDetailLoading(userData);
  }

}