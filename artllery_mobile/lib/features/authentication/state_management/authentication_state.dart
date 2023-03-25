// base authentication state
abstract class AuthenticationState {}

// state to represent the initial state
class AuthenticationInitialState extends AuthenticationState {}

// state to represent the user being authenticated
class AuthenticationSuccessState extends AuthenticationState {
  final String accessToken;

  AuthenticationSuccessState({required this.accessToken});
}

// state to represent the user being logged out
class LogoutState extends AuthenticationState {}