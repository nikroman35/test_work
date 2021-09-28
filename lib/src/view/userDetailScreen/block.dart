import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/src/models/users_presentation.dart';
import 'package:test_work/src/view/userDetailScreen/event.dart';
import 'package:test_work/src/view/userDetailScreen/state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc(this.userData) : super(UserDetailLoading(userData));

  final UserPresentationOnDetail userData;

  @override
  Stream<UserDetailState> mapEventToState(UserDetailEvent event) async* {
    if (event is UserDetailInit) {
      yield* initData();
    }
  }

  Stream<UserDetailState> initData() async* {
    yield UserDetailLoading(userData);
  }

}