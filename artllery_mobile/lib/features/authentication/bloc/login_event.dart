abstract class LoginEvent {}

class LoginSubmittedEvent extends LoginEvent{
  final String username;
  final String password;

  LoginSubmittedEvent({
    required this.username,
    required this.password
});

}

class LogoutEvent extends LoginEvent{}

class CheckToken extends LoginEvent{

}