abstract class LoginEvent {}

class LoginAuth extends LoginEvent {
  String nameString;

  LoginAuth(this.nameString);
}
class LoginInit extends LoginEvent {}
