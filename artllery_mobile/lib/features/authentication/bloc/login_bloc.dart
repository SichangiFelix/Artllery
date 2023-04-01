import 'package:bloc/bloc.dart';

import '../services/auth_service.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late String username;
  late String password;
  late String exceptionMessage;

  final AuthService authService;
  LoginBloc(
      {required this.authService})
      : super(PreLoginState()){
      on<LoginSubmittedEvent>((event, emit) async {
        emit(LoginSubmittingState());
        try {
          await authService.loginUser(username: username, password: password);
          emit(LoginSuccessState());
        } catch (exception) {
          print(exception.toString());
          exceptionMessage = exception.toString();
          emit(LoginFailedState(exception: exception.toString()));
        }
      });
  }
}
