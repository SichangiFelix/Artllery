import 'dart:async';

import 'package:bloc/bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AuthenticationSuccessEvent) {
      yield AuthenticationSuccessState(accessToken: event.accessToken);
    } else if (event is LogoutEvent) {
      yield LogoutState();
    }
  }
}