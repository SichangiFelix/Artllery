abstract class LoginState{}

class PreLoginState extends LoginState{

}

class LoggedIn extends LoginState{

}
class LoginSubmittingState extends LoginState {

}
class LoginSuccessState extends LoginState {

}
class LoginFailedState extends LoginState {
  final String? exception;

  LoginFailedState({ this.exception});
}