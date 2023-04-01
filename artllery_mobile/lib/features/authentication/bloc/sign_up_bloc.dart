import 'package:artllery_mobile/features/authentication/bloc/sign_up_event.dart';
import 'package:artllery_mobile/features/authentication/bloc/sign_up_state.dart';
import 'package:bloc/bloc.dart';

import '../services/auth_service.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late Map<String, String> signUpData = {};
  late String exceptionMessage;

  final AuthService authService;
  SignUpBloc(
      {required this.authService})
      : super(PreSignUpState()){
    on<SignUpSubmittedEvent>((event, emit) async {
      emit(SignUpSubmittingState());
      try {
        await authService.createUser(data: signUpData);
        emit(SignUpSuccessState());
      } catch (exception) {
        exceptionMessage = exception.toString();
        emit(SignUpFailedState(exception: exceptionMessage));
      }
    });
  }
}
