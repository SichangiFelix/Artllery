// base authentication event
abstract class AuthenticationEvent {}

// event to handle authentication success
class AuthenticationSuccessEvent extends AuthenticationEvent {
  final String accessToken;

  AuthenticationSuccessEvent({required this.accessToken});
}

// event to handle logout
class LogoutEvent extends AuthenticationEvent {}