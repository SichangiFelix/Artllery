abstract class LoginEvent {}

class LoginSubmittedEvent extends LoginEvent{
  // final String accessToken;
  //
  // LoginSubmittedEvent({required this.accessToken});
}

class LogoutEvent extends LoginEvent{}